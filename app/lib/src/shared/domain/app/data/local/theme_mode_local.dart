import 'package:flutter/material.dart';

class ThemeModeLocal {
  final String themeModeName;

  ThemeModeLocal(this.themeModeName);

  ThemeMode toThemeMode() =>
      ThemeMode.values.firstWhere((e) => e.name == themeModeName,
          orElse: () => ThemeMode.system);
}
