import 'package:flutter/material.dart';

extension ThemeModeHelper on ThemeMode {
  String getTitle() {
    switch (this) {
      case ThemeMode.dark:
        return 'Escuro';
      case ThemeMode.light:
        return 'Claro';
      case ThemeMode.system:
        return 'Sistema';
      default:
        return 'Sitema';
    }
  }
}
