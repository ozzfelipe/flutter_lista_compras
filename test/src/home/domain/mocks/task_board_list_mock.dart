import 'package:lista_de_compras/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

final List<TaskBoard> taskBoardListmock = [taskBoard1, taskBoard2, taskBoard3];

final TaskBoard taskBoard1 = TaskBoard(Uuid.v1(), "Mock Task 1");
final TaskBoard taskBoard2 = TaskBoard(Uuid.v1(), "Mock Task 2");
final TaskBoard taskBoard3 = TaskBoard(Uuid.v1(), "Mock Task 3", enable: false);
