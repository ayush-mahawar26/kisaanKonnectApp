import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisaan_konnect/constants/colors.dart';
import 'package:kisaan_konnect/utils/material_color.dart';

class AppTheme {
  ThemeData appTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
          primary: AppColors.accentMain, secondary: AppColors.secondary),
      primaryColorLight: AppColors.accentMain,
      primaryColor: AppColors.accentMain,
      fontFamily: GoogleFonts.poppins().fontFamily,
      primarySwatch: getMaterialColor(AppColors.accentMain),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryText,
        ),
        bodyMedium: TextStyle(
          fontSize: 24,
          color: AppColors.primaryText,
        ),
        bodySmall: TextStyle(
          fontSize: 16,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}
