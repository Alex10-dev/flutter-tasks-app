import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  final _colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xff37247C),
    secondary: const Color(0xFFD77B2B),
  );

  ThemeData get(){

    return ThemeData(
      brightness: Brightness.light,
      colorScheme: _colorScheme,

      textTheme: TextTheme(
        displayLarge: GoogleFonts.roboto(
          fontSize: 57,
          fontWeight: FontWeight.normal,
          color: _colorScheme.onPrimary,
        ),
        displayMedium: GoogleFonts.roboto(
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: _colorScheme.onPrimary,
        ),
        headlineLarge: GoogleFonts.roboto(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: _colorScheme.onPrimary,
        ),
        headlineMedium: GoogleFonts.roboto(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: _colorScheme.onPrimary,
        ),
        headlineSmall: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: _colorScheme.onPrimary,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: 16,
          color: _colorScheme.onBackground,
        ),
        bodySmall: GoogleFonts.openSans(
          fontSize: 14,
          color: _colorScheme.onBackground,
        ),
        labelMedium: GoogleFonts.roboto(
          fontSize: 14,
        ),
        labelLarge: GoogleFonts.roboto(
          fontSize: 16,
        ),
        titleMedium: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.roboto(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        )
      )
    );
  }
}