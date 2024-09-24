import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';
class RadioTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        children: [
          SizedBox(height: 90,),
          Image.asset('assets/images/radio_image.png'),
          SizedBox(height: 30,),
          Text('اذاعه القران الكريم',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
              color: provider.isDarkMode()?
                  Colors.white:
                  Colors.black
          ),),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Expanded(flex:5,
                 child: Icon(Icons.skip_previous,
               color:provider.isDarkMode()?
               Color(0xffFACC1D):
               Color(0xffB7935F) ,
               size: 30,)) ,
              Expanded(flex:1 ,
                  child: Icon(Icons.play_arrow,
                    color:provider.isDarkMode()?
                    Color(0xffFACC1D):
                    Color(0xffB7935F),
                    size: 50,)),
            Expanded(flex:5,
                child: Icon(Icons.skip_next,
                  color:provider.isDarkMode()?
                  Color(0xffFACC1D):
                  Color(0xffB7935F),
                  size: 30,))
            ],
          )
        ],
      ),
    );
  }
}
