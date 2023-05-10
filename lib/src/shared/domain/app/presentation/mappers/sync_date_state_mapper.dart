import 'package:lista_de_compras/src/shared/domain/app/presentation/app_sync_date_state.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/mappers/sync_date_presentation_mapper.dart';
import 'package:result_dart/result_dart.dart';

class SyncDateStateMapper {
  final SyncDatePresentationMapper _mapper;

  SyncDateStateMapper(this._mapper);

  AppSyncDateState call(Result<DateTime, Exception> result) {
    return result.fold((s) => AppSyncDateState.success(_mapper(s)),
        (f) => AppSyncDateState.empty());
  }
}
