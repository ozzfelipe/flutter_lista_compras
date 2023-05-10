import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/mappers/sync_date_state_mapper.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_last_sync_date.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode.dart';
import 'package:rxdart/subjects.dart';

import 'app_intent.dart';
import 'app_sync_date_state.dart';
import 'app_theme_state.dart';
import 'exceptions/exceptions.dart';

class AppViewModel extends Disposable {
  final SaveThemeMode _saveThemeMode;
  final GetThemeMode _getThemeMode;
  final SyncDateStateMapper _syncDateStateMapper;
  final GetLastSyncDate _getLastSyncDate;

  AppViewModel(this._saveThemeMode, this._getThemeMode,
      this._syncDateStateMapper, this._getLastSyncDate) {
    _init();
  }

  late final BehaviorSubject<AppThemeState> appThemeController;
  final BehaviorSubject<AppSyncDateState> appSyncDateController =
      BehaviorSubject();

  _init() {
    var res = _getThemeMode();
    appThemeController = BehaviorSubject.seeded(AppThemeState(res));

    handleIntent(GetLastSyncDateIntent());
  }

  handleIntent(AppIntent intent) {
    if (intent is SetThemeModeIntent) {
      _setThemMode(intent.themeMode);
      return;
    }

    if (intent is GetLastSyncDateIntent) {
      _getSyncDateHandler();
      return;
    }

    throw IntentNotImplementdException();
  }

  void _setThemMode(ThemeMode themeMode) {
    appThemeController.sink.add(AppThemeState(themeMode));
    _saveTheme(themeMode);
  }

  @override
  void dispose() {
    appThemeController.close();
    appSyncDateController.close();
  }

  void _saveTheme(ThemeMode themeMode) => _saveThemeMode(themeMode);

  void _getSyncDateHandler() {
    appSyncDateController.sink.add(_syncDateStateMapper(_getLastSyncDate()));
  }
}
