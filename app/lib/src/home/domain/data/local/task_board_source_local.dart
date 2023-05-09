import 'package:result_dart/result_dart.dart';

import '../../../../shared/services/realm/models/task_model.dart';
import '../../../data/local/task_board_list_service_interface.dart';
import '../../presentation/exceptions/task_board_exceptions.dart';
import '../../presentation/usecases/task_board_list_source_interface.dart';

class TaskBoardListLocal extends ITaskBoardListSource {
  final ITaskBoardServiceLocal _serviceLocal;

  TaskBoardListLocal(this._serviceLocal);
  @override
  Result<List<TaskBoard>, TaskBoardException> getTaskBoards() {
    try {
      var res = _serviceLocal.getTaskBoards();

      return Result.success(res);
    } catch (e) {
      return Result.failure(GetTaskBoardListException());
    }
  }
}
