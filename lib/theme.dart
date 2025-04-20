import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Colors.redAccent;
  static const Color background = Colors.white;
  static const Color accent = Colors.green;
  static const Color textDark = Color(0xFF000000);
  static const Color textLight = Color(0xFF888888);
  static const Color cardBackground = Color(0xFFF5F5F5);
  static const Color gradientStart = Color.fromRGBO(89, 115, 255, 1);
  static const Color gradientEnd = Color.fromRGBO(22, 241, 255, 1);
}

class AppTextStyles {
  static final heading = GoogleFonts.lato(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static final subheading = GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static final body = GoogleFonts.lato(
    fontSize: 16,
    color: AppColors.textDark,
  );

  static final caption = GoogleFonts.lato(
    fontSize: 14,
    color: AppColors.textLight,
  );

  static final button = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
}

/// PADDINGS
class AppPaddings {
  static const EdgeInsets screen = EdgeInsets.symmetric(horizontal: 30.0);
  static const EdgeInsets section = EdgeInsets.symmetric(vertical: 20.0);
  static const EdgeInsets item = EdgeInsets.all(10.0);
}

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    bodyLarge: TextStyle(
      color: AppColors.textDark,
      fontFamilyFallback: ['Noto Color Emoji', 'Apple Color Emoji', 'Segoe UI Emoji'],
    ),
    bodyMedium: TextStyle(
      color: AppColors.textDark,
      fontFamilyFallback: ['Noto Color Emoji', 'Apple Color Emoji', 'Segoe UI Emoji'],
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
      fontSize: 24,
      fontFamilyFallback: ['Noto Color Emoji', 'Apple Color Emoji', 'Segoe UI Emoji'],
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
      fontSize: 18,
      fontFamilyFallback: ['Noto Color Emoji', 'Apple Color Emoji', 'Segoe UI Emoji'],
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.accent,
  ),
);
