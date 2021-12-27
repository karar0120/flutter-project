import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:recpie/style/color.dart';

ThemeData Themdark=ThemeData(
  fontFamily: 'Jannah',
    primarySwatch: DefultColor,
    //floatingActionButtonTheme: FloatingActionButtonThemeData(
      //  backgroundColor: Colors.deepOrange
    //),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type:BottomNavigationBarType.fixed,
      selectedItemColor: DefultColor,
      elevation: 20.0,
      unselectedItemColor: Colors.grey,
      backgroundColor: HexColor('333739'),
    ),
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme:AppBarTheme(
      titleSpacing: 20.0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: HexColor('333739'),
      elevation: 0.0,
      titleTextStyle:TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
    textTheme: TextTheme(
        bodyText1:TextStyle(
            fontFamily: 'Jannah',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),
        subtitle1:TextStyle(
        fontFamily: 'Jannah',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
            height: 1.3
    )
    )

);






ThemeData Themlight=ThemeData(
  fontFamily: 'Jannah',
  primarySwatch: DefultColor,
  //floatingActionButtonTheme: FloatingActionButtonThemeData(
    //  backgroundColor: Colors.deepOrange
  //),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type:BottomNavigationBarType.fixed,
    selectedItemColor: DefultColor,
    elevation: 20.0,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle:TextStyle(
      fontFamily: 'Jannah',
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
        color: Colors.black
    ),
  ),
  textTheme: TextTheme(
      bodyText1:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      subtitle1:TextStyle(
          fontFamily: 'Jannah',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          height: 1.0
      )

  ),
);