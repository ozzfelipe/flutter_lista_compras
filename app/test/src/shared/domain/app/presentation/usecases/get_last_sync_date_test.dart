import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/exceptions.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_last_sync_date.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_last_sync_date_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

class GetLastSyncDateSourceMock extends Mock implements GetLastSyncDateSource {}

void main() {
  final GetLastSyncDateSource source = GetLastSyncDateSourceMock();
  final GetLastSyncDate sut = GetLastSyncDate(source);

  final DateTime syncDateMock = DateTime.now();
  group('get last sync date tests', () {
    test('should usecase return a sync date', () {
      when(() => source()).thenAnswer((_) => Result.success(syncDateMock));
      var result = sut();

      expect(result.getOrNull(), equals(syncDateMock));

      verify(() => source()).called(1);
    });
    test('should usecase return a empty sync date exception', () {
      when(() => source())
          .thenAnswer((_) => Result.failure(EmptySyncDateException()));
      var result = sut();

      expect(result.exceptionOrNull() is EmptySyncDateException, true);

      verify(() => source()).called(1);
    });
  });
}
