import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/home/domain/presentation/task_card_presentation.dart';
import 'package:lista_de_compras/src/home/widgets/task_card.dart';

class TaskBoardList extends StatelessWidget {
  const TaskBoardList({super.key});

  @override
  Widget build(BuildContext context) {
    TaskCardPresentation taskCard = TaskCardPresentation(
      status: 'Pendente',
      title: 'Nova Lista',
      progress: 0.5,
      progressLinePercent: '50%',
      tasksLength: '2/4',
      completed: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.primary,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 100),
        itemBuilder: (_, index) {
          return TaskCard(taskCard: taskCard);
        },
        separatorBuilder: (_, index) => const SizedBox(height: 24),
        itemCount: 10,
      ),
    );
  }
}
