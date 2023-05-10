import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode_source.dart';

class SaveThemeMode {
  final SaveThemeModeSource source;

  SaveThemeMode(this.source);
  void call(ThemeMode themeMode) {
    source(themeMode);
  }
}
