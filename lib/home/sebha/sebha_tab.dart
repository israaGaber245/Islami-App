import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';
class SebhaTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: provider.isDarkMode()?
                Image.asset(
                  'assets/images/body_sebha_dark.png',
                  height: 200,
                ):
                Image.asset(
                  'assets/images/sebha_body.png',
                  height: 200,
                ),
              ),provider.isDarkMode()?
              Image.asset(
                'assets/images/head_sebha_dark.png',
                height: 100,
              ):
              Image.asset(
                'assets/images/sebha_head.png',
                height: 100,
              ),
            ],
          ),
          SizedBox(height: 30,),
          Text('عدد التسبيحات',
            style: TextStyle(
                color: provider.isDarkMode()?
                    Colors.white:
                    Colors.black
            ),),
          SizedBox(height: 20,),
         OutlinedButton(onPressed: (){},
             child:Text('30',style: TextStyle(
                 color:provider.isDarkMode()?
                     Colors.white:
             Colors.black,fontWeight:FontWeight.w400 ),),
           style: OutlinedButton.styleFrom(side: BorderSide( color:provider.isDarkMode()?
           Color(0xff151b31):
           Color(0xffc8b395)),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),),backgroundColor:provider.isDarkMode()?
               Color(0xff151b31):
               Color(0xffc8b395),
               fixedSize: Size.fromHeight(60)),
         ),
          SizedBox(height: 10,),
          OutlinedButton(onPressed: (){},
            child:Text('سبحان الله',style: TextStyle(
                color:
                provider.isDarkMode()?
                    Colors.black:
                Colors.white ),),
            style: OutlinedButton.styleFrom(side: BorderSide(
                color: provider.isDarkMode()?
                Colors.yellowAccent:
                Theme.of(context).primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),),backgroundColor:provider.isDarkMode()?
              Colors.yellowAccent:
              Theme.of(context).primaryColor,),
          ),

        ],
      ),
    );
  }
}
