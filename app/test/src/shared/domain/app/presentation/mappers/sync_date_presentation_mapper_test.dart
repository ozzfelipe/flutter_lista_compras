import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/mappers/sync_date_presentation_mapper.dart';

void main() {
  final SyncDatePresentationMapper sut = SyncDatePresentationMapper();
  final DateFormat df = DateFormat('dd/MM/yyyy às hh:mm');

  var syncDateMock = DateTime(2023, 1, 1, 1, 1);

  group('sync date presentation mapper tests', () {
    test('should return a formated date string', () {
      var result = sut.call(syncDateMock);
      expect(result.syncDate.isNotEmpty, true);
      expect(result.syncDate, equals(df.format(syncDateMock)));
    });
  });
}
