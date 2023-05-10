import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/home/pages/home/home_view_model.dart';
import 'package:lista_de_compras/src/home/widgets/custom_drawer.dart';
import 'package:lista_de_compras/src/home/widgets/task_board_list_view.dart';
import 'package:lista_de_compras/src/shared/utils/routes/routes.dart';

import '../../../shared/widgets/user_image_button.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _homeViewModel = Modular.get();

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: UserImageButton(),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            StreamBuilder<TaskBoardListState>(
                stream: _homeViewModel.taskBoardlistController.stream,
                builder: (context, snapshot) {
                  var state = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      state is LoadingTaskBoardListState) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (state is EmptyTaskBoardListState ||
                      state is ErrorTaskBoardListState) {
                    return const Center(
                      child: Text('Nenhuma lista encontrada'),
                    );
                  }

                  return TaskBoardListView(
                    taskBoardList:
                        (state as SuccessTaskBoardListState).taskboardList,
                  );
                }),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(value: 0, label: Text('Todos')),
                    ButtonSegment(value: 1, label: Text('Pendentes')),
                    ButtonSegment(value: 2, label: Text('Concluídos')),
                    ButtonSegment(value: 3, label: Text('Desativados')),
                  ],
                  selected: const {0},
                  onSelectionChanged: (value) {},
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Modular.to.pushNamed('.${Routes.newTask}'),
        icon: const Icon(Icons.edit),
        label: const Text('Nova Lista'),
      ),
    );
  }
}
