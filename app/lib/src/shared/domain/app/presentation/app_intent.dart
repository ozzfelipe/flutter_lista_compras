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

class GetLastSyncDateIntent extends AppIntent {
  GetLastSyncDateIntent() : super._();
}

class NotImplementedIntent extends AppIntent {
  NotImplementedIntent() : super._();
}
