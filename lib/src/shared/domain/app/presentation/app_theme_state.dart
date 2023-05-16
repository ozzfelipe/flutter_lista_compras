import 'package:flutter/material.dart';

sealed class AppThemeState {
  ThemeMode themeMode = ThemeMode.system;
  AppThemeState._();

  factory AppThemeState.system() => SystemThemeState();
  factory AppThemeState.dark() => DarkThemeState();
  factory AppThemeState.ligth() => LigthThemeState();
}

class SystemThemeState extends AppThemeState {
  SystemThemeState() : super._();
}

class LigthThemeState extends AppThemeState {
  LigthThemeState() : super._();
  @override
  ThemeMode get themeMode => ThemeMode.light;
}

class DarkThemeState extends AppThemeState {
  DarkThemeState() : super._();
  @override
  ThemeMode get themeMode => ThemeMode.dark;
}
