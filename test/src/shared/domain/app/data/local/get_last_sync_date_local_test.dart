import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/shared/data/local/configuration_service_local_interface.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/exceptions.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/get_last_sync_date_local.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_last_sync_date_source.dart';
import 'package:lista_de_compras/src/shared/services/realm/models/configuration_model.dart';
import 'package:mocktail/mocktail.dart';

class ConfigurationServiceLocalMock extends Mock
    implements IConfigurationServiceLocal {}

void main() {
  final IConfigurationServiceLocal serviceLocal =
      ConfigurationServiceLocalMock();
  final GetLastSyncDateSource sut = GetLastSyncDateLocal(serviceLocal);

  var syncDateMock = DateTime.now();

  group('get last sync date local tests', () {
    test('should return a theme mode', () {
      when(() => serviceLocal.getConfiguration())
          .thenAnswer((_) => ConfigurationModel('', syncDate: syncDateMock));

      var result = sut();

      expect(result.getOrNull(), equals(syncDateMock));

      verify(() => serviceLocal.getConfiguration()).called(1);
    });
    test('should return a empty sync date exception', () {
      when(() => serviceLocal.getConfiguration())
          .thenAnswer((_) => ConfigurationModel(''));

      var result = sut();

      expect(result.exceptionOrNull() is EmptySyncDateException, true);

      verify(() => serviceLocal.getConfiguration()).called(1);
    });
  });
}
