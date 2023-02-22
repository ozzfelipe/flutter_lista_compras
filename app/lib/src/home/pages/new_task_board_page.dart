import 'package:flutter/material.dart';

class NewTaskBoardPage extends StatefulWidget {
  const NewTaskBoardPage({super.key});

  @override
  State<NewTaskBoardPage> createState() => _NewTaskBoardPageState();
}

class _NewTaskBoardPageState extends State<NewTaskBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Lista'),
      ),
    );
  }
}
