import 'package:lista_de_compras/src/home/domain/presentation/exceptions/task_board_exceptions.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../shared/services/realm/models/task_model.dart';

abstract class TaskBoardListSource {
  /// get all task boards
  Result<List<TaskBoard>, TaskBoardException> getTaskBoards();
}
