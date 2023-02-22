import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/home/widgets/custom_drawer.dart';

import '../shared/widgets/user_image_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SegmentedButton<int>(
                showSelectedIcon: false,
                segments: const [
                  ButtonSegment(value: 0, label: Text('Todos')),
                  ButtonSegment(value: 1, label: Text('Pendentes')),
                  ButtonSegment(value: 2, label: Text('Concluídos')),
                  ButtonSegment(value: 3, label: Text('Desativados')),
                ],
                selected: const {0},
                onSelectionChanged: (value) {},
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.edit),
        label: const Text('Nova lista'),
      ),
    );
  }
}
