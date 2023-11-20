import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_themes/home_screen.dart';
import 'package:multiple_themes/theme/app_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeTypes appTheme = ref.watch(appThemeProvider);
    return MaterialApp(
      title: 'Flutter Multiple Themes',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: appTheme.theme.primary,
          secondaryHeaderColor: appTheme.theme.secondary,
          scaffoldBackgroundColor: appTheme.theme.primary,
          appBarTheme: AppBarTheme(
            backgroundColor: appTheme.theme.primary,
          )),
      home: const HomeScreen(),
    );
  }
}
