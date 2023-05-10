import 'package:lista_de_compras/src/shared/data/local/configuration_service_local_interface.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/exceptions.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_last_sync_date_source.dart';
import 'package:result_dart/result_dart.dart';

class GetLastSyncDateLocal extends GetLastSyncDateSource {
  final IConfigurationServiceLocal _service;

  GetLastSyncDateLocal(this._service);
  @override
  Result<DateTime, Exception> call() {
    var configuration = _service.getConfiguration();
    try {
      if (configuration.syncDate != null) {
        return Result.success(configuration.syncDate!);
      }
      throw EmptySyncDateException();
    } catch (e) {
      return Result.failure(EmptySyncDateException());
    }
  }
}
