import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color(0xff00c9ff);
const semiPrimary = Color(0xff7fe3ff);
const secondary = Color(0xffa98e47);
const greyText = Color(0xff666666);
const darkPrimary = Color(0xff00708D);
const lightGreyText = Colors.grey;
const whiteBackground = Color(0xFFF5F5F5);
const yellowLogin = Color(0xffd2b25b);
const semiWhiteBackground = Color(0xfff2f2f2);
const redAlert = Color(0xffdb5252);
const darkWhite = Color(0xfff5f5f5);

ThemeData tissTheme(BuildContext context) {
  return ThemeData(
    primaryColor: const Color(0xff00c9ff),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff00c9ff),
      secondary: const Color(0xffa98e47),
    ),
    textTheme: GoogleFonts.nunitoTextTheme(
      Theme.of(context).textTheme,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff00c9ff),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff00c9ff),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
