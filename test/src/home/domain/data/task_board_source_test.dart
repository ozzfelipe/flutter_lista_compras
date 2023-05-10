import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/home/data/local/task_board_list_service_interface.dart';
import 'package:lista_de_compras/src/home/domain/data/local/task_board_source_local.dart';
import 'package:lista_de_compras/src/home/domain/presentation/exceptions/task_board_exceptions.dart';
import 'package:lista_de_compras/src/home/domain/presentation/usecases/task_board_list_source_interface.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/task_board_list_mock.dart';

class TaskBoardServiceLocalMock extends Mock
    implements ITaskBoardServiceLocal {}

void main() {
  late final ITaskBoardServiceLocal service;
  late final ITaskBoardListSource sut;

  setUpAll(() {
    service = TaskBoardServiceLocalMock();
    sut = TaskBoardListLocal(service);
  });

  group("task board source tests", () {
    test("should return a empty task board list", () {
      when(() => service.getTaskBoards()).thenAnswer((_) => []);

      var result = sut.getTaskBoards();

      expect(result.getOrNull()?.isEmpty, true);
      verify(() => service.getTaskBoards()).called(1);
    });
    test("should return a task board list", () {
      when(() => service.getTaskBoards()).thenAnswer((_) => taskBoardListmock);

      var result = sut.getTaskBoards();

      expect(result.getOrNull()?.length, taskBoardListmock.length);
      verify(() => service.getTaskBoards()).called(1);
    });
    test("should return a exception", () {
      when(() => service.getTaskBoards())
          .thenThrow((_) => GetTaskBoardListException());

      var result = sut.getTaskBoards();

      expect(result.exceptionOrNull(), isA<GetTaskBoardListException>());
      verify(() => service.getTaskBoards()).called(1);
    });
  });
}
