import 'package:flutter/material.dart';

enum TaskBoardStatus {
  pending('Pendente', Icons.access_time),
  completed('Completo', Icons.check),
  disabled('Desativado', Icons.cancel_outlined);

  final String title;
  final IconData icon;

  const TaskBoardStatus(this.title, this.icon);
}
