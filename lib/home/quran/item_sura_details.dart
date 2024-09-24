import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/home/quran/sura_details_screen.dart';

class ItemSuraDetails extends StatelessWidget {
  String name;
  int index;
  ItemSuraDetails({required this.name,required this.index});
  @override
  Widget build(BuildContext context) {
    return Text(
          '$name${{index+1}}',
          style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,

    );
  }
}
