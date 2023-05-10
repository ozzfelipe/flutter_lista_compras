import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode_source.dart';
import 'package:mocktail/mocktail.dart';

class SaveThemeModeSourceMock extends Mock implements SaveThemeModeSource {}

void main() {
  final SaveThemeModeSource source = SaveThemeModeSourceMock();
  final SaveThemeMode sut = SaveThemeMode(source);
  group('save theme mode tests', () {
    test('should usecase receive a theme mode to save', () {
      registerFallbackValue(ThemeMode.light);

      when(() => source(any()));
      sut(ThemeMode.light);

      var verifyResult = verify(() => source(captureAny()));
      verifyResult.called(1);
      expect(verifyResult.captured.first, equals(ThemeMode.light));
    });
  });
}
