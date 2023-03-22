import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/shared/data/local/configuration_service_local_interface.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/save_theme_mode_local.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode_source.dart';
import 'package:mocktail/mocktail.dart';

class ConfigurationServiceLocalMock extends Mock
    implements IConfigurationServiceLocal {}

void main() {
  final IConfigurationServiceLocal serviceLocal =
      ConfigurationServiceLocalMock();
  final SaveThemeModeSource sut = SaveThemeModeLocal(serviceLocal);

  group('save theme mode local tests', () {
    test('should receive a theme mode name to save localy', () {
      when(() => serviceLocal.saveThemeMode(any()));

      sut(ThemeMode.dark);

      var verifyResult = verify(() => serviceLocal.saveThemeMode(captureAny()));
      verifyResult.called(1);
      expect(verifyResult.captured.first, equals(ThemeMode.dark.name));
    });
  });
}
