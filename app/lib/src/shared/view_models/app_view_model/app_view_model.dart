import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/shared/view_models/app_view_model/app_intent.dart';

import 'app_theme_state.dart';

class AppViewModel extends Disposable {
  static AppThemeState initThemeState = AppThemeState(ThemeMode.system);

  final StreamController<AppThemeState> appThemeController =
      StreamController.broadcast()..add(initThemeState);

  handleIntent(AppIntent intent) {
    if (intent is SetThemeModeIntent) {
      setThemMode(intent.themeMode);
    }
  }

  void setThemMode(ThemeMode themeMode) =>
      appThemeController.sink.add(AppThemeState(themeMode));

  @override
  void dispose() {
    appThemeController.close();
  }
}
