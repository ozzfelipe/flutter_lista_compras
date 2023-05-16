import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/home/domain/presentation/mappers/task_board_list_state_mapper.dart';
import 'package:rxdart/subjects.dart';

import '../../../shared/domain/app/presentation/exceptions/exceptions.dart';
import '../../domain/presentation/usecases/get_task_board_list_usecase.dart';
import 'home_intent.dart';
import 'home_state.dart';

class HomeViewModel extends Disposable {
  final GetTaskBoardList _getTaskBoardList;
  final TaskBoardListStateMapper _taskBoardListMapper;
  final BehaviorSubject<TaskBoardListState> taskBoardlistController =
      BehaviorSubject.seeded(TaskBoardListState.loading());

  HomeViewModel(this._getTaskBoardList, this._taskBoardListMapper) {
    _init();
  }

  _init() {
    handleIntent(HomeIntent.getAllTaskBoardList());
  }

  handleIntent(HomeIntent intent) async {
    if (intent is GetAllTaskBoardListIntent) {
      _getAllTaskBoardsHandle();
      return;
    }

    throw IntentNotImplementdException();
  }

  @override
  void dispose() {
    taskBoardlistController.close();
  }

  void _getAllTaskBoardsHandle() {
    taskBoardlistController.sink.add(_taskBoardListMapper(_getTaskBoardList()));
  }
}
