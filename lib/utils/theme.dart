import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final fontname = GoogleFonts.poppins().fontFamily;
  static final lightTheme = ThemeData(
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
  ));
  static final darkTheme = ThemeData(
      // textTheme: GoogleFonts.poppinsTextTheme().apply(
      //   bodyColor:Colors.white,
      //   displayColor: Colors.white,
      // ),
      textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: fontname,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      fontFamily: fontname,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  ));
}
