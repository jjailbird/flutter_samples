import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final carrotTheme = ThemeData(
  primaryColor: Colors.white,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
);

const seedColor = Color(0xff00ffff);

ThemeData getMd3Dark(BuildContext context) {
  return ThemeData(
      colorSchemeSeed: seedColor,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.notoSansNKoTextTheme(Theme.of(context).textTheme));
}


ThemeData getDefaultTheme(BuildContext context) {
  return ThemeData(
      colorSchemeSeed: seedColor,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.notoSansNKoTextTheme(Theme.of(context).textTheme));
}


