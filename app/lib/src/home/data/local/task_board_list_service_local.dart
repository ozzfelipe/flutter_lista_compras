import 'package:lista_de_compras/src/home/data/local/task_board_list_service_interface.dart';
import 'package:realm/realm.dart';

import '../../../shared/services/realm/models/task_model.dart';
import '../../domain/presentation/exceptions/task_board_exceptions.dart';

class TaskBoardServicelocal extends ITaskBoardServiceLocal {
  final Realm _realm;

  TaskBoardServicelocal(this._realm);
  @override
  List<TaskBoard> getTaskBoards() {
    try {
      var res = _realm.all<TaskBoard>();

      return res.toList();
    } catch (e) {
      throw GetTaskBoardListException();
    }
  }
}
