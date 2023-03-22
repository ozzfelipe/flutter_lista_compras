import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode_source.dart';
import 'package:mocktail/mocktail.dart';

class GetThemeModeSourceMock extends Mock implements GetThemeModeSource {}

void main() {
  final GetThemeModeSource source = GetThemeModeSourceMock();
  final GetThemeMode sut = GetThemeMode(source);
  group('get theme mode tests', () {
    test('should usecase return a theme mode', () {
      when(() => source()).thenAnswer((_) => ThemeMode.light);
      var result = sut();

      expect(result, equals(ThemeMode.light));

      verify(() => source()).called(1);
    });
  });
}
