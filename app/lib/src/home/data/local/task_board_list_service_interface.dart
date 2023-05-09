import '../../../shared/services/realm/models/task_model.dart';

abstract class ITaskBoardServiceLocal {
  List<TaskBoard> getTaskBoards();
}
