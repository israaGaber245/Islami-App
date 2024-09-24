import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/home/hadeth/hadeth_tab.dart';
import 'package:islamiapp/home/hadeth/item_hadeth_details.dart';
import 'package:islamiapp/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args=ModalRoute.of(context)?.settings.arguments as HadethTabArgs;

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
            args.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body:args.content.isEmpty ?
        Center(
          child: CircularProgressIndicator(),):
        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height *0.06,
            horizontal: MediaQuery.of(context).size.width *0.05
          ),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:  provider.isDarkMode()?
                MyTheme.primaryDark:
            MyTheme.white,
            borderRadius: BorderRadius.circular(24)
          ),
          child: ListView.builder(
            itemBuilder: (context,index){
           return ItemHadethDetails( content: args.content[index]);
          },itemCount: args.content.length,
          ),
        )
      )
    ]);
  }


}

