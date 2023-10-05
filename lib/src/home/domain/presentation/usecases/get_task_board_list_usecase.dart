import 'package:lista_de_compras/src/home/domain/data/local/task_board_list_source_interface.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../shared/services/realm/models/task_model.dart';
import '../exceptions/task_board_exceptions.dart';

class GetTaskBoardList {
  final ITaskBoardListSource _source;

  GetTaskBoardList(this._source);
  Result<List<TaskBoard>, TaskBoardException> call() => _source.getTaskBoards();
}
