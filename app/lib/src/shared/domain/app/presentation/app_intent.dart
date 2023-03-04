import 'package:flutter/material.dart';

class AppIntent {
  AppIntent._();

  factory AppIntent.setThemeMode(ThemeMode themeMode) =>
      SetThemeModeIntent(themeMode);
}

class SetThemeModeIntent extends AppIntent {
  final ThemeMode themeMode;
  SetThemeModeIntent(this.themeMode) : super._();
}
