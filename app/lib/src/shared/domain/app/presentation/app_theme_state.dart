import 'package:flutter/material.dart';

class AppThemeState {
  ThemeMode themeMode;
  AppThemeState(this.themeMode);

  // factory AppThemeState.system() => SystemThemeState();
  // factory AppThemeState.dark() => DarkThemeState();
  // factory AppThemeState.ligth() => LigthThemeState();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppThemeState && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
}

// class SystemThemeState extends AppThemeState {
//   SystemThemeState() : super._();
// }

// class LigthThemeState extends AppThemeState {
//   LigthThemeState() : super._();
// }

// class DarkThemeState extends AppThemeState {
//   DarkThemeState() : super._();
// }
