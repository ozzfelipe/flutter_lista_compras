import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/home/domain/data/local/task_board_list_source_interface.dart';
import 'package:lista_de_compras/src/home/domain/presentation/exceptions/task_board_exceptions.dart';
import 'package:lista_de_compras/src/home/domain/presentation/usecases/get_task_board_list_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../mocks/task_board_list_mock.dart';

class TaskBoardListSourceMock extends Mock implements ITaskBoardListSource {}

void main() {
  late final ITaskBoardListSource source;
  late final GetTaskBoardList sut;

  setUpAll(() {
    source = TaskBoardListSourceMock();
    sut = GetTaskBoardList(source);
  });

  group("get task board list usecase tests", () {
    test("should return a empty task board list", () {
      when(() => source.getTaskBoards()).thenAnswer((_) => Result.success([]));

      var result = sut();

      expect(result.getOrNull()?.isEmpty, true);
      verify(() => source.getTaskBoards()).called(1);
    });
    test("should return a task board list", () {
      when(() => source.getTaskBoards())
          .thenAnswer((_) => Result.success(taskBoardListmock));

      var result = sut();

      expect(result.getOrNull()?.length, taskBoardListmock.length);
      verify(() => source.getTaskBoards()).called(1);
    });
    test("should return a exception", () {
      when(() => source.getTaskBoards())
          .thenAnswer((_) => Result.failure(GetTaskBoardListException()));

      var result = sut();

      expect(result.exceptionOrNull(), isA<GetTaskBoardListException>());
      verify(() => source.getTaskBoards()).called(1);
    });
  });
}
