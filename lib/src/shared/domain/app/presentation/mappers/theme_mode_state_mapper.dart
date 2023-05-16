import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_theme_state.dart';

final class ThemeModeStateMapper {
  ThemeModeStateMapper();

  AppThemeState call(ThemeMode theme) => switch (theme) {
        ThemeMode.system => AppThemeState.system(),
        ThemeMode.dark => AppThemeState.dark(),
        ThemeMode.light => AppThemeState.ligth(),
      };
}
