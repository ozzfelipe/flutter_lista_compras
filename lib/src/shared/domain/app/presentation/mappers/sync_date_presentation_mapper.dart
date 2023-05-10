import 'package:intl/intl.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/sync_date_presentation.dart';

class SyncDatePresentationMapper {
  SyncDatePresentation call(DateTime syncDate) {
    DateFormat df = DateFormat('dd/MM/yyyy às hh:mm');

    return SyncDatePresentation(df.format(syncDate));
  }
}
