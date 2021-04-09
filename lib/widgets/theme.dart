import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      textTheme: TextTheme(
        bodyText2:
            TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
      ),
      primaryColor: Colors.red,
      buttonColor: greyColor,
      brightness: Brightness.light,
      canvasColor: creamColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ),
      fontFamily: GoogleFonts.lato().fontFamily,
      primarySwatch: MaterialColor(0xFF403b58, const <int, Color>{
        50: const Color(0xFF403b58),
        100: const Color(0xFF403b58),
        200: const Color(0xFF403b58),
        300: const Color(0xFF403b58),
        400: const Color(0xFF403b58),
        500: const Color(0xFF403b58),
        600: const Color(0xFF403b58),
        700: const Color(0xFF403b58),
        800: const Color(0xFF403b58),
        900: const Color(0xFF403b58),
      }));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      textTheme: TextTheme(
        bodyText2:
            TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
      ),
      canvasColor: greyColor,
      // accentColor: Colors.w,
      buttonColor: Colors.blue,
      primaryColor: Colors.blue,
      cardColor: blueColor,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      fontFamily: GoogleFonts.lato().fontFamily,
      primarySwatch: MaterialColor(0xFF403b58, const <int, Color>{
        50: const Color(0xFF403b58),
        100: const Color(0xFF403b58),
        200: const Color(0xFF403b58),
        300: const Color(0xFF403b58),
        400: const Color(0xFF403b58),
        500: const Color(0xFF403b58),
        600: const Color(0xFF403b58),
        700: const Color(0xFF403b58),
        800: const Color(0xFF403b58),
        900: const Color(0xFF403b58),
      }));
  static Color greyColor = Color(0xff403b58);
  static Color creamColor = Color(0xffdbdbdb);
  static Color darkColor = Color(0xff090a17);
  static Color blueColor = Color(0xff0a0c26);
}
