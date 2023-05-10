import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/shared/data/local/configuration_service_local_interface.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/get_theme_mode_local.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode_source.dart';
import 'package:lista_de_compras/src/shared/services/realm/models/configuration_model.dart';
import 'package:mocktail/mocktail.dart';

class ConfigurationServiceLocalMock extends Mock
    implements IConfigurationServiceLocal {}

void main() {
  final IConfigurationServiceLocal serviceLocal =
      ConfigurationServiceLocalMock();
  final GetThemeModeSource sut = GetThemeModeLocal(serviceLocal);

  group('get theme mode local tests', () {
    test('should return a theme mode', () {
      when(() => serviceLocal.getConfiguration())
          .thenAnswer((_) => ConfigurationModel(ThemeMode.dark.name));

      var result = sut();

      expect(result, equals(ThemeMode.dark));

      verify(() => serviceLocal.getConfiguration()).called(1);
    });
    test(
        'should return a theme mode system when there`s no theme mode saved localy',
        () {
      when(() => serviceLocal.getConfiguration())
          .thenAnswer((_) => ConfigurationModel(''));

      var result = sut();

      expect(result, equals(ThemeMode.system));

      verify(() => serviceLocal.getConfiguration()).called(1);
    });
  });
}
