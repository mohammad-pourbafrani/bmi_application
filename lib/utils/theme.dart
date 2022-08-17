import 'package:bmi_application/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final fontname = GoogleFonts.poppins().fontFamily;
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldLightColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldLightColor,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: AppColors.scaffoldLightColor),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: fontname,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        fontFamily: fontname,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      headline3: TextStyle(
        fontFamily: fontname,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontFamily: fontname,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        fontFamily: fontname,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      subtitle2: TextStyle(
        fontFamily: fontname,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(width: 2.0, color: Colors.white54),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(width: 2.0, color: Colors.white),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(width: 2.0, color: Colors.white24),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    // textTheme: GoogleFonts.poppinsTextTheme().apply(
    //   bodyColor:Colors.white,
    //   displayColor: Colors.white,
    // ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarDarkColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: fontname,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        fontFamily: fontname,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      headline3: TextStyle(
        fontFamily: fontname,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontFamily: fontname,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        fontFamily: fontname,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      subtitle2: TextStyle(
        fontFamily: fontname,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(width: 2.0, color: Colors.white54),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(width: 2.0, color: Colors.white),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(width: 2.0, color: Colors.white24),
      ),
    ),
  );
}
