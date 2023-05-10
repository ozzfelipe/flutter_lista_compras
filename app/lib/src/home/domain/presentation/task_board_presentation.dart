import 'package:flutter/material.dart';

import '../../../shared/services/realm/models/task_model.dart';
import 'enums/task_board_status.dart';

class TaskBoardPresentation {
  final TaskBoardStatus status;
  final String title;
  final List<Task> tasks;
  final double progress;
  final String progressText;

  TaskBoardPresentation({
    required this.status,
    required this.title,
    required this.tasks,
    required this.progress,
    required this.progressText,
  });

  factory TaskBoardPresentation.fromTaskBoard(TaskBoard taskBoard) {
    return TaskBoardPresentation(
      status: _getStatus(taskBoard),
      title: taskBoard.title,
      tasks: taskBoard.tasks,
      progress: _getProgess(taskBoard),
      progressText: _getProgessText(taskBoard),
    );
  }

  static TaskBoardStatus _getStatus(TaskBoard taskBoard) {
    if (!taskBoard.enable) return TaskBoardStatus.disabled;
    if (taskBoard.tasks.every((e) => e.complete)) {
      return TaskBoardStatus.completed;
    }

    return TaskBoardStatus.pending;
  }

  static double _getProgess(TaskBoard taskBoard) {
    if (taskBoard.tasks.isEmpty) return 0;
    var completedTasks = taskBoard.tasks.where((e) => e.complete).length;

    if (completedTasks == 0) return 0;

    return completedTasks / taskBoard.tasks.length;
  }

  static String _getProgessText(TaskBoard taskBoard) {
    if (taskBoard.tasks.isEmpty) return '';
    var completedTasks = taskBoard.tasks.where((e) => e.complete).length;

    return '$completedTasks/${taskBoard.tasks.length}';
  }
}

extension TaskBoardPresentationHelper on TaskBoardPresentation {
  Color getBackgroundColor(BuildContext context) {
    return _getColor(context);
  }

  Color getForegroundColor(BuildContext context) {
    return _getColor(context).withOpacity(0.5);
  }

  Color _getColor(BuildContext context) {
    var theme = Theme.of(context);
    switch (status) {
      case TaskBoardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskBoardStatus.completed:
        return theme.colorScheme.tertiaryContainer;
      case TaskBoardStatus.disabled:
        return theme.colorScheme.errorContainer;
    }
  }
}
