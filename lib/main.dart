import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_themes/my_app.dart';
import 'package:multiple_themes/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int? selectedTheme = prefs.getInt(AppTheme.themeKey);
  runApp(
    ProviderScope(
      overrides: [
        sharedPrefProvider.overrideWithValue(prefs),
        if (selectedTheme != null)
          appThemeProvider
              .overrideWith((ref) => ThemeTypes.values[selectedTheme]),
      ],
      child: const MyApp(),
    ),
  );
}
