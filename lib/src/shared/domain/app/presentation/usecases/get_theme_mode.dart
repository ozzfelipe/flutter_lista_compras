import 'package:flutter/material.dart';

import 'get_theme_mode_source.dart';

class GetThemeMode {
  final GetThemeModeSource _source;

  GetThemeMode(this._source);
  ThemeMode call() => _source();
}
