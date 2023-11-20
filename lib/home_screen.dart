import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_themes/main.dart';
import 'package:multiple_themes/theme/app_theme.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeTypes appTheme = ref.watch(appThemeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Multiple Themes',
          style: TextStyle(color: appTheme.theme.textColor),
        ),
      ),
      body: ListView.builder(
        itemCount: ThemeTypes.values.length,
        itemBuilder: (context, index) {
          return RadioListTile<ThemeTypes>(
            value: ThemeTypes.values[index],
            groupValue: ref.watch(appThemeProvider),
            activeColor: appTheme.theme.secondary,
            onChanged: _onChanged,
            title: Text(
              ThemeTypes.values[index].title,
              style: TextStyle(color: appTheme.theme.secondary),
            ),
          );
        },
      ),
    );
  }

  void _onChanged(ThemeTypes? theme) {
    if (theme != null) {
      ref.read(appThemeProvider.notifier).state = theme;
      ref.read(sharedPrefProvider).setInt(AppTheme.themeKey, theme.index);
    }
  }
}
