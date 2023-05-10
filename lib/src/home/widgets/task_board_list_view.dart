import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/home/domain/presentation/task_board_list_presentation.dart';
import 'package:lista_de_compras/src/home/widgets/task_board_view.dart';

class TaskBoardListView extends StatelessWidget {
  final TaskboardListPresentation taskBoardList;
  const TaskBoardListView({super.key, required this.taskBoardList});

  @override
  Widget build(BuildContext context) {
    var items = taskBoardList.items;
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(28, 88, 28, 116),
      itemBuilder: (_, index) {
        return TaskBoardView(taskBoard: items[index]);
      },
      separatorBuilder: (_, index) => const SizedBox(height: 24),
      itemCount: items.length,
    );
  }
}
