import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: "ElMessiri",
    primaryColorLight: Colors.deepOrange,
    primaryColor: Colors.deepOrange,
    // focusColor: Colors.deepOrange,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 18, color: Colors.black),
      bodyText2: TextStyle(fontSize: 10, color: Colors.black),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(elevation: 0),
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        elevation: 0),
    scaffoldBackgroundColor: Colors.white);

ThemeData darkTheme = ThemeData(
  iconTheme: IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 18, color: Colors.white),
    bodyText2: TextStyle(fontSize: 10, color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed, backgroundColor: Colors.black),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  scaffoldBackgroundColor: Colors.grey,
);
