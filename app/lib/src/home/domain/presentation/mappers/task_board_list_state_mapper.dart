import 'package:lista_de_compras/src/home/domain/presentation/task_board_list_presentation.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../shared/services/realm/models/task_model.dart';
import '../../../pages/home/home_state.dart';
import '../exceptions/task_board_exceptions.dart';
import '../task_board_presentation.dart';

class TaskBoardListStateMapper {
  TaskBoardListState call(Result<List<TaskBoard>, TaskBoardException> result) {
    return result.fold((success) {
      if (success.isEmpty) {
        return TaskBoardListState.empty();
      }

      List<TaskBoardPresentation> items =
          success.map((e) => TaskBoardPresentation.fromTaskBoard(e)).toList();

      return TaskBoardListState.success(TaskboardListPresentation(items));
    }, (failure) {
      return TaskBoardListState.error();
    });
  }
}
