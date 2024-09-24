import 'package:flutter/material.dart';
import 'package:islamiapp/home/HomeScreen.dart';
import 'package:islamiapp/home/provider/app_config_provider.dart';
import 'package:islamiapp/home/quran/sura_details_screen.dart';
import 'package:islamiapp/my_theme.dart';
import 'package:islamiapp/home/hadeth/hadeth_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( ChangeNotifierProvider(
      create: (context)=>AppConfigProvider() ,
      child: MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
   return MaterialApp(
     initialRoute: HomeScreen.routeName,
     routes: {
       HomeScreen.routeName: (context) => HomeScreen(),
       SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
       HadethDetailsScreen.routeName: (context) => HadethDetailsScreen()
     },
     localizationsDelegates:AppLocalizations.localizationsDelegates,
     supportedLocales: AppLocalizations.supportedLocales,
     locale: Locale(provider.appLanguage),
     home: HomeScreen(),
     theme: MyTheme.lightMode,
     darkTheme: MyTheme.darkMode,
     themeMode: provider.theme,

   );
  }

}

