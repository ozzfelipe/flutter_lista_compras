import 'dart:ui';

class TaskCardPresentation {
  final String status;
  final String title;
  final double progress;
  final String progressLinePercent;
  final String tasksLength;
  final bool completed;

  final Color backgroundColor;
  final Color foregroundColor;

  TaskCardPresentation({
    required this.status,
    required this.title,
    required this.progress,
    required this.progressLinePercent,
    required this.tasksLength,
    required this.completed,
    required this.backgroundColor,
    required this.foregroundColor,
  });
}
