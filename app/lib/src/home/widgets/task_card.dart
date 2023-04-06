import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/home/domain/presentation/task_card_presentation.dart';

class TaskCard extends StatelessWidget {
  final TaskCardPresentation taskCard;
  const TaskCard({
    super.key,
    required this.taskCard,
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
          color: taskCard.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: theme.iconTheme.color?.withOpacity(0.5),
                  ),
                  const Spacer(),
                  Text(
                    taskCard.status,
                    style: textTheme.bodySmall?.copyWith(
                      color: textTheme.bodySmall?.color?.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                taskCard.title,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (!taskCard.completed)
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
                              value: taskCard.progress,
                              color: taskCard.foregroundColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            taskCard.progressLinePercent,
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
                      taskCard.tasksLength,
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
