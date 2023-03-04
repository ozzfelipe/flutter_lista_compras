import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode.dart';
import 'package:rxdart/subjects.dart';

import 'app_intent.dart';
import 'app_theme_state.dart';

class AppViewModel extends Disposable {
  final SaveThemeMode _saveThemeMode;
  final GetThemeMode _getThemeMode;

  AppViewModel(this._saveThemeMode, this._getThemeMode) {
    _init();
  }

  late final BehaviorSubject<AppThemeState> appThemeController;

  _init() {
    var res = _getThemeMode();
    appThemeController = BehaviorSubject.seeded(AppThemeState(res));
  }

  handleIntent(AppIntent intent) {
    if (intent is SetThemeModeIntent) {
      _setThemMode(intent.themeMode);
    }
  }

  void _setThemMode(ThemeMode themeMode) {
    appThemeController.sink.add(AppThemeState(themeMode));
    _saveTheme(themeMode);
  }

  @override
  void dispose() {
    appThemeController.close();
  }

  void _saveTheme(ThemeMode themeMode) => _saveThemeMode(themeMode);
}
