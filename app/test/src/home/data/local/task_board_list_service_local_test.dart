import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/home/data/local/task_board_list_service_interface.dart';
import 'package:lista_de_compras/src/home/data/local/task_board_list_service_local.dart';
import 'package:lista_de_compras/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

import '../../domain/mocks/task_board_list_mock.dart';

void main() {
  late final Realm realm;
  late final ITaskBoardServiceLocal sut;

  setUpAll(() {
    realm = Realm(Configuration.inMemory([TaskBoard.schema, Task.schema]));
    sut = TaskBoardServicelocal(realm);
  });
  tearDownAll(() {
    realm.close();
  });

  group("task board service local tests", () {
    test("Open a local realm", () {
      expect(realm.isClosed, isFalse);
    });
    test("should return a empty task board list", () {
      var result = sut.getTaskBoards();

      expect(result.isEmpty, true);
    });
    test("should return a task board list", () {
      realm.write(() {
        realm.addAll(taskBoardListmock);
      });

      var result = sut.getTaskBoards();

      expect(result.length, taskBoardListmock.length);
    });
    test("should return a exception", () {
      realm.close();

      expectLater(() => sut.getTaskBoards(), throwsException);
    });
  });
}
