import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/home/quran/item_sura_details.dart';
import 'package:islamiapp/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sure_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verse=[];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args=ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if(verse.isEmpty){
      laod(args.index);
    }
    return Stack(children: [
      provider.isDarkMode()?
      Image.asset('assets/images/dark_bg.png',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,):
      Image.asset(
        'assets/images/main_background.png',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            '${args.name}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body:verse.length ==0 ?
        Center(
          child: CircularProgressIndicator(),):
        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height *0.06,
            horizontal: MediaQuery.of(context).size.width *0.05
          ),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: provider.isDarkMode()?
                MyTheme.primaryDark:
            MyTheme.white,
            borderRadius: BorderRadius.circular(24)
          ),
          child: ListView.builder(
            itemBuilder: (context,index){
           return ItemSuraDetails(  name: verse[index],index:index);
          },itemCount: verse.length,
          ),
        )
      )
    ]);
  }

  void laod(int index) async{
    String content= await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines=content.split('\n');
    verse=lines;
    setState(() {

    });
  }
}
class SuraDetailsArgs{
  String name;
  int index;
  SuraDetailsArgs({required this.name,required this.index});

}
