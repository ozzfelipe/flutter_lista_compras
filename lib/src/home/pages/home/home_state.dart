import '../../domain/presentation/task_board_list_presentation.dart';

sealed class TaskBoardListState {
  TaskBoardListState._();

  factory TaskBoardListState.loading() => LoadingTaskBoardListState();
  factory TaskBoardListState.success(TaskboardListPresentation taskboardList) =>
      SuccessTaskBoardListState(taskboardList);
  factory TaskBoardListState.empty() => EmptyTaskBoardListState();
  factory TaskBoardListState.error() => ErrorTaskBoardListState();
}

class LoadingTaskBoardListState extends TaskBoardListState {
  LoadingTaskBoardListState() : super._();
}

class EmptyTaskBoardListState extends TaskBoardListState {
  EmptyTaskBoardListState() : super._();
}

class ErrorTaskBoardListState extends TaskBoardListState {
  ErrorTaskBoardListState() : super._();
}

class SuccessTaskBoardListState extends TaskBoardListState {
  final TaskboardListPresentation taskboardList;

  SuccessTaskBoardListState(this.taskboardList) : super._();
}
