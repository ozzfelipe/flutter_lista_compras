import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/theme_mode_local.dart';

void main() {
  late ThemeModeLocal sut;

  group('theme mode local tests', () {
    test('should receive a theme mode name', () {
      sut = ThemeModeLocal(ThemeMode.dark.name);

      expect(sut.themeModeName, equals(ThemeMode.dark.name));
    });
    test('should return a theme mode', () {
      sut = ThemeModeLocal(ThemeMode.dark.name);

      expect(sut.toThemeMode(), equals(ThemeMode.dark));
    });
    test(
        'should return a theme mode system when receive an empty theme mode name',
        () {
      sut = ThemeModeLocal('');

      expect(sut.toThemeMode(), equals(ThemeMode.system));
    });
  });
}
