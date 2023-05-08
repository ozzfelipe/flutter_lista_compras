import 'package:result_dart/result_dart.dart';

import '../../../../shared/services/realm/models/task_model.dart';
import '../exceptions/task_board_exceptions.dart';
import 'get_task_board_list_source.dart';

class GetTaskBoardList {
  final TaskBoardListSource _source;

  GetTaskBoardList(this._source);
  Result<List<TaskBoard>, TaskBoardException> call() => _source.getTaskBoards();
}
