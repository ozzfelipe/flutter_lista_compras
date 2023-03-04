import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/shared/data/local/configuration_service_local_interface.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/theme_mode_local.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode_source.dart';

class GetThemeModeLocal extends GetThemeModeSource {
  final IConfigurationServiceLocal _configurationServiceLocal;

  GetThemeModeLocal(this._configurationServiceLocal);
  @override
  ThemeMode call() {
    var configuration = _configurationServiceLocal.getConfiguration();

    return ThemeModeLocal(configuration.themeModeName).toThemeMode();
  }
}
