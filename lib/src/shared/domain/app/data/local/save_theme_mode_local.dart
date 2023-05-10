import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode_source.dart';

import '../../../../data/local/configuration_service_local_interface.dart';

class SaveThemeModeLocal extends SaveThemeModeSource {
  final IConfigurationServiceLocal _configurationServiceLocal;

  SaveThemeModeLocal(this._configurationServiceLocal);
  @override
  void call(ThemeMode themeMode) {
    _configurationServiceLocal.saveThemeMode(themeMode.name);
  }
}
