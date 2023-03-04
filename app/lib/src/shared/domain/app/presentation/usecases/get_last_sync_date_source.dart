import 'package:result_dart/result_dart.dart';

abstract class GetLastSyncDateSource {
  Result<DateTime, Exception> call();
}
