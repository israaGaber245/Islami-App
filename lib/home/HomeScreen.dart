import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/home/hadeth/hadeth_tab.dart';
import 'package:islamiapp/home/provider/app_config_provider.dart';
import 'package:islamiapp/home/quran/quran_tab.dart';
import 'package:islamiapp/home/radio/radio_tab.dart';
import 'package:islamiapp/home/sebha/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp/home/settings/setting_tab.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget{
  static const String routeName='home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected=0;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset('assets/images/dark_bg.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,):
        Image.asset('assets/images/main_background.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,style: Theme.of(context).textTheme.titleLarge,),
          ),
          body: tabs[selected],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor
            ),
            child: BottomNavigationBar(
              currentIndex: selected,
              onTap: (index){
                selected=index;
                setState(() {

                });
              },
                items:[
                BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/images/icon_quran.png'),),label:AppLocalizations.of(context)!.quran ),
                BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png'),),label: AppLocalizations.of(context)!.hadeth),
                  BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/icon_sebha.png'),),label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/icon_radio.png'),),label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                      icon:Icon(Icons.settings),label: AppLocalizations.of(context)!.setting ),
                ]),
          ))],

    );
  }
  List<Widget>tabs=[
  QuranTab(),HadethTab(),SebhaTab(),RadioTab(),SettingTab()
  ];
}