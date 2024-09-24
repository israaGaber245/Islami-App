import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/home/quran/sura_details_screen.dart';
import 'package:islamiapp/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class ItemSuraName extends StatelessWidget {
  String name;
  int index;
  ItemSuraName({required this.name, required this.index});
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
        arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Text(
          name,
          style:provider.isDarkMode()?
          Theme.of(context).textTheme.titleSmall?.copyWith(
            color: MyTheme.white
          ):
          Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
