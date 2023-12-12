import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_themes/theme/dark_theme.dart';
import 'package:multiple_themes/theme/light_theme.dart';
import 'package:multiple_themes/theme/national_day_theme.dart';

final appThemeProvider = StateProvider<ThemeTypes>((ref) => ThemeTypes.light);

abstract class AppTheme {
  static const String themeKey = 'theme_key';
  abstract final Color primary;
  abstract final Color secondary;
  abstract final Color textColor;
}

enum ThemeTypes {
  system('System'),
  light('Light'),
  dark('Dark'),
  nationalDay('National Day');

  final String title;
  const ThemeTypes(
    this.title,
  );
}

extension ThemeTypesEx on ThemeTypes {
  AppTheme get theme {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    switch (this) {
      case ThemeTypes.system:
        return brightness == Brightness.dark ? DarkTheme() : LightTheme();
      case ThemeTypes.light:
        return LightTheme();
      case ThemeTypes.dark:
        return DarkTheme();
      case ThemeTypes.nationalDay:
        return NationalDayTheme();
    }
  }
}
