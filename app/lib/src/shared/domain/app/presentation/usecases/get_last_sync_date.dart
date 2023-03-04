import 'package:result_dart/result_dart.dart';

import 'get_last_sync_date_source.dart';

class GetLastSyncDate {
  final GetLastSyncDateSource _source;

  GetLastSyncDate(this._source);

  Result<DateTime, Exception> call() => _source();
}
