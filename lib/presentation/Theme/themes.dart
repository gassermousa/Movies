// ignore: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_/presentation/components/colors.dart';

ThemeData darkTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.white),
    hintColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      iconColor: defaultColor,
      labelStyle: TextStyle(color: defaultColor),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white)),
    ),
    cardTheme: CardTheme(
      color: darkModeColor,
    ),
    textTheme: TextTheme(
      // ignore: prefer_const_constructors
      bodyText1: TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        color: Colors.white,
      ),
      caption: TextStyle(
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    dividerColor: Colors.white,
    scaffoldBackgroundColor: darkModeColor,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0.sp,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: darkModeColor,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: darkModeColor,
            statusBarIconBrightness: Brightness.light)),
    primarySwatch: defaultColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: darkModeColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: defaultColor));

ThemeData LightTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0.sp,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light)),
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: defaultColor));
