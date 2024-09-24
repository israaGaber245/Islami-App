import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/home/hadeth/item_hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethTabArgs> hadethlist = [];
  @override
  Widget build(BuildContext context) {
    if (hadethlist.isEmpty) {
      load();
    }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
          thickness: 3,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name ,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          thickness: 3,
          color: Theme.of(context).primaryColor,
        ),
        hadethlist.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ItemHadethName(h: hadethlist[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 3,
                        color: Theme.of(context).primaryColor,
                      );
                    },
                    itemCount: hadethlist.length))
      ],
    );
  }

  void load() async {
    String file = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethList = file.split('#\r\n');
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> hadethLine = ahadethList[i].split('\n');
      String title = hadethLine[0];
      hadethLine.removeAt(0);
      HadethTabArgs hadeth = HadethTabArgs(title: title, content: hadethLine);
      hadethlist.add(hadeth);
      setState(() {});
    }
  }
}

class HadethTabArgs {
  String title;
  List<String> content;
  HadethTabArgs({required this.title, required this.content});
}
