import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/home/domain/presentation/enums/task_board_status.dart';

import '../domain/presentation/task_board_presentation.dart';

class TaskBoardView extends StatelessWidget {
  final TaskBoardPresentation taskBoard;
  const TaskBoardView({
    super.key,
    required this.taskBoard,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 140,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: taskBoard.getBackgroundColor(context),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    taskBoard.status.icon,
                    color: theme.iconTheme.color?.withOpacity(0.5),
                  ),
                  const Spacer(),
                  Text(
                    taskBoard.status.title,
                    style: textTheme.bodySmall?.copyWith(
                      color: textTheme.bodySmall?.color?.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                taskBoard.title,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (taskBoard.status != TaskBoardStatus.pending &&
                  taskBoard.tasks.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    SizedBox(
                      width: screenSize.width * .6,
                      child: Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: taskBoard.progress,
                              color: taskBoard.getForegroundColor(context),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            taskBoard.progressPercentText,
                            style: textTheme.bodySmall?.copyWith(
                              color:
                                  textTheme.bodySmall?.color?.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      taskBoard.progressText,
                      style: textTheme.bodySmall?.copyWith(
                        color: textTheme.bodySmall?.color?.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
