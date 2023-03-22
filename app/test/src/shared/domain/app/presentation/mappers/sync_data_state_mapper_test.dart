import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/exceptions.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_sync_date_state.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/mappers/sync_date_presentation_mapper.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/mappers/sync_date_state_mapper.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  final SyncDatePresentationMapper mapper = SyncDatePresentationMapper();
  final SyncDateStateMapper sut = SyncDateStateMapper(mapper);

  final syncDateMock = DateTime.now();

  group('sync date state mapper tests', () {
    test('should return a success sync date state', () {
      var result = sut(Result.success(syncDateMock));

      expect(result, isA<SuccessSyncDateState>());
    });
    test(
        'should return a empty sync date state when result is an empty sync date exception',
        () {
      var result = sut(Result.failure(EmptySyncDateException()));

      expect(result, isA<EmptySyncDateState>());
    });
    test('should return a empty sync date state when return any exception', () {
      var result = sut(Result.failure(Exception()));

      expect(result, isA<EmptySyncDateState>());
    });
  });
}
