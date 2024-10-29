import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_meteo_weather_app/utils/theme/themes/app_theme.dart';

class AppTextTheme {
  const AppTextTheme._();

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: displayLarge.copyWith(color: AppTheme.darkColors.defaultText),
    displayMedium:
        displayMedium.copyWith(color: AppTheme.darkColors.defaultText),
    displaySmall: displaySmall.copyWith(color: AppTheme.darkColors.defaultText),
    headlineLarge:
        headlineLarge.copyWith(color: AppTheme.darkColors.defaultText),
    headlineMedium:
        headlineMedium.copyWith(color: AppTheme.darkColors.defaultText),
    headlineSmall:
        headlineSmall.copyWith(color: AppTheme.darkColors.defaultText),
    titleLarge: titleLarge.copyWith(color: AppTheme.darkColors.defaultText),
    titleMedium: titleMedium.copyWith(color: AppTheme.darkColors.defaultText),
    titleSmall: titleSmall.copyWith(color: AppTheme.darkColors.defaultText),
    bodyLarge: bodyLarge.copyWith(color: AppTheme.darkColors.defaultText),
    bodyMedium: bodyMedium.copyWith(color: AppTheme.darkColors.defaultText),
    bodySmall: bodySmall.copyWith(color: AppTheme.darkColors.defaultText),
    labelLarge: labelLarge.copyWith(color: AppTheme.darkColors.defaultText),
    labelMedium: labelMedium.copyWith(color: AppTheme.darkColors.defaultText),
    labelSmall: labelSmall.copyWith(color: AppTheme.darkColors.defaultText),
  );

  static TextTheme textTheme = TextTheme(
    displayLarge:
        displayLarge.copyWith(color: AppTheme.lightColors.defaultText),
    displayMedium:
        displayMedium.copyWith(color: AppTheme.lightColors.defaultText),
    displaySmall:
        displaySmall.copyWith(color: AppTheme.lightColors.defaultText),
    headlineLarge:
        headlineLarge.copyWith(color: AppTheme.lightColors.defaultText),
    headlineMedium:
        headlineMedium.copyWith(color: AppTheme.lightColors.defaultText),
    headlineSmall:
        headlineSmall.copyWith(color: AppTheme.lightColors.defaultText),
    titleLarge: titleLarge.copyWith(color: AppTheme.lightColors.defaultText),
    titleMedium: titleMedium.copyWith(color: AppTheme.lightColors.defaultText),
    titleSmall: titleSmall.copyWith(color: AppTheme.lightColors.defaultText),
    bodyLarge: bodyLarge.copyWith(color: AppTheme.lightColors.defaultText),
    bodyMedium: bodyMedium.copyWith(color: AppTheme.lightColors.defaultText),
    bodySmall: bodySmall.copyWith(color: AppTheme.lightColors.defaultText),
    labelLarge: labelLarge.copyWith(color: AppTheme.lightColors.defaultText),
    labelMedium: labelMedium.copyWith(color: AppTheme.lightColors.defaultText),
    labelSmall: labelSmall.copyWith(color: AppTheme.lightColors.defaultText),
  );

  static TextStyle displayLarge =
      GoogleFonts.manrope(fontSize: 57, fontWeight: FontWeight.w700);
  static TextStyle displayMedium =
      GoogleFonts.manrope(fontSize: 45, fontWeight: FontWeight.w700);
  static TextStyle displaySmall =
      GoogleFonts.manrope(fontSize: 36, fontWeight: FontWeight.w700);

  static TextStyle headlineLarge =
      GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w700);
  static TextStyle headlineMedium =
      GoogleFonts.manrope(fontSize: 28, fontWeight: FontWeight.w700);
  static TextStyle headlineSmall =
      GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w700);

  static TextStyle titleLarge =
      GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.w700);
  static TextStyle titleMedium =
      GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700);
  static TextStyle titleSmall =
      GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700);

  static TextStyle bodyLarge =
      GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle bodyMedium =
      GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle bodySmall =
      GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w400);

  static TextStyle labelLarge =
      GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700);
  static TextStyle labelMedium =
      GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle labelSmall = GoogleFonts.manrope(
      fontSize: 8, fontWeight: FontWeight.w700, letterSpacing: 0);
}

extension AppTextThemeX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
