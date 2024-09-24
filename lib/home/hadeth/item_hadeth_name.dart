import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/home/hadeth/hadeth_details_screen.dart';
import 'package:islamiapp/home/hadeth/hadeth_tab.dart';
import 'package:islamiapp/home/quran/sura_details_screen.dart';
import 'package:islamiapp/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class ItemHadethName extends StatelessWidget {
  HadethTabArgs h;
  ItemHadethName({required this.h});
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
        arguments: h);
      },
      child: Text(
         h.title,
          style: provider.isDarkMode()?
          Theme.of(context).textTheme.titleSmall?.copyWith(
            color: MyTheme.white
          ) :
          Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
