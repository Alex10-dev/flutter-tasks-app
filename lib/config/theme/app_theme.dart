import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  ThemeData get(){

    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xff37247C),
      tertiary: const Color(0xFFD77B2B),
    );

    return ThemeData(
      colorScheme: colorScheme,

      textTheme: TextTheme(
        displayLarge: GoogleFonts.roboto(
          fontSize: 57,
          fontWeight: FontWeight.normal,
          color: colorScheme.onPrimary,
        ),
        displayMedium: GoogleFonts.roboto(
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
        headlineSmall: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: colorScheme.onPrimary,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: 16,
          color: colorScheme.onBackground,
        ),
        bodySmall: GoogleFonts.openSans(
          fontSize: 14,
          color: colorScheme.onBackground,
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