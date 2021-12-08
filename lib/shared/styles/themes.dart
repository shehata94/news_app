import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme =  ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: Colors.grey[800],
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.orange,
        backgroundColor: Colors.grey[800],
        unselectedItemColor: Colors.white
    ),
    fontFamily: 'Jannah',
    textTheme: TextTheme(
        headline2: TextStyle(
            color: Colors.white,fontSize: 24
        ),
        bodyText1: TextStyle(
            color: Colors.white,fontSize: 18
        )
    ),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.grey[800],
      ),
      color: Colors.grey[800],
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      elevation: 0.0,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    )
);

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.orange,
    ),
    fontFamily: 'Jannah ',
    textTheme: TextTheme(
        headline2: TextStyle(
            color: Colors.black,fontSize: 24
        ),
        bodyText1: TextStyle(
            color: Colors.black,fontSize: 18
        )
    ),
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      color: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      elevation: 0.0,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    )
);