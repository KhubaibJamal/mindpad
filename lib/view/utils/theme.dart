import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  dialogTheme: DialogTheme(
    backgroundColor: CustomColors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CustomColors.primary,
      unselectedItemColor: CustomColors.grey,
      selectedItemColor: CustomColors.white),
  splashColor: CustomColors.white.withOpacity(1),
  highlightColor: CustomColors.white.withOpacity(1),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CustomColors.primary,
    selectionColor: CustomColors.primary,
    selectionHandleColor: CustomColors.white,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: CustomColors.primary,
  ),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(CustomColors.primary))),
  appBarTheme: AppBarTheme(
      color: CustomColors.primaryLight,
      elevation: 0,
      foregroundColor: CustomColors.black),
  scaffoldBackgroundColor: CustomColors.primaryLight,
  primaryColor: CustomColors.primary,
  primaryColorLight: CustomColors.primary.withOpacity(.5),
  brightness: Brightness.light,
  hintColor: CustomColors.grey,
  switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.all(CustomColors.primary.withOpacity(.5)),
      trackColor: WidgetStateProperty.all(CustomColors.bg)),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: CustomColors.secondary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          fixedSize: const WidgetStatePropertyAll<Size>(Size(999, 40)),
          backgroundColor: WidgetStatePropertyAll(CustomColors.primary),
          padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 10, vertical: 10)))),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Georgia',
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: CustomColors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Georgia',
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: CustomColors.black,
    ),
    titleLarge: TextStyle(
        fontFamily: 'Hind', fontSize: 24.0, color: CustomColors.black),
    headlineMedium: TextStyle(
      fontFamily: 'Hind',
      fontSize: 24.0,
      color: CustomColors.black,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Hind',
      fontSize: 16.0,
      color: CustomColors.black,
    ),
    displaySmall: const TextStyle(
      fontSize: 14.0,
      color: Colors.grey,
      fontFamily: 'Hind',
    ),
    bodySmall: TextStyle(
      color: CustomColors.grey,
      fontFamily: 'Hind',
      fontSize: 16.0,
    ),
    bodyMedium: const TextStyle(color: Color(0xFF807A6B)),
    bodyLarge: const TextStyle(color: Colors.brown),
  ),
);

class CustomColors {
  static Color primary = const Color(0xff7e0102);
  static Color primaryLight = Colors.white;
  static Color secondary = Colors.purpleAccent;
  static Color error = Colors.red;
  static Color success = Colors.green;
  static Color black = Colors.black;
  static Color bg = Colors.black12.withOpacity(.5);
  static Color white = Colors.white;
  static Color grey = Colors.grey;
}