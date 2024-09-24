import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryLight=Color(0xffB7935F);
  static Color primaryDark=Color(0xff151b31);
  static Color black=Color(0xff242424);
  static Color white=Color(0xffFFFFFF);
  static Color yellow=Color(0xffFACC1D);
  static ThemeData lightMode=ThemeData(
    primaryColor: primaryLight ,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: black
        )
      ),
      textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
      ),
        titleMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400
        ),
        titleSmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        )
  ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: black,
      unselectedItemColor: white,
    )
  );
  static ThemeData darkMode=ThemeData(
      primaryColor: primaryDark ,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: white
          )
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: white
          ),
          titleMedium: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
            color: white
          ),
          titleSmall: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            color: yellow
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellow,
        unselectedItemColor: white,
      )
  );
}