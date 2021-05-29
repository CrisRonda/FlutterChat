import 'package:flutter/material.dart';

const primaryColor = Color(0xffff5722);
const backgroundLightColor = Color(0xfffffcfc);
const backgroundDarkColor = Color(0xff1f2026);
const navigationBarLightColor = Color(0xffff8a50);
const navigationBarDarkColor = Color(0xffc41c00);

TextTheme _textTheme({bool isDark = false}) => TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
          fontSize: 32),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.red : Colors.green,
        fontSize: 28,
      ),
      subtitle1: TextStyle(
          fontSize: 24, color: isDark ? Colors.white : Colors.black38),
      caption: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: isDark ? Colors.white : Colors.black38),
      bodyText1: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: isDark ? Colors.white : Colors.black),
      bodyText2: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: isDark ? Colors.white : Colors.black54),
      button: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
    );

class Themes {
  static final themeLight = ThemeData.light().copyWith(
      backgroundColor: backgroundLightColor,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black38, fontSize: 24)),
      accentColor: primaryColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor, foregroundColor: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: navigationBarLightColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[500],
      ),
      toggleableActiveColor: primaryColor,
      canvasColor: Colors.white,
      textTheme: _textTheme());

  static final themeDark = ThemeData.dark().copyWith(
      backgroundColor: backgroundDarkColor,
      accentColor: primaryColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor, foregroundColor: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: navigationBarDarkColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[600],
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.white,
      ),
      toggleableActiveColor: primaryColor,
      canvasColor: backgroundDarkColor,
      appBarTheme: AppBarTheme(
          color: backgroundDarkColor,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)),
      textTheme: _textTheme(isDark: true));
}
