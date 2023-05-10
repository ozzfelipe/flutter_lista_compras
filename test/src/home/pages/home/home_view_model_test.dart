import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/home/domain/presentation/mappers/task_board_list_state_mapper.dart';
import 'package:lista_de_compras/src/home/domain/presentation/usecases/get_task_board_list_usecase.dart';
import 'package:lista_de_compras/src/home/pages/home/home_intent.dart';
import 'package:lista_de_compras/src/home/pages/home/home_state.dart';
import 'package:lista_de_compras/src/home/pages/home/home_view_model.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/exceptions/exceptions.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/mocks/task_board_list_mock.dart';

class GetTaskBoardListMock extends Mock implements GetTaskBoardList {}

void main() {
  late final HomeViewModel sut;
  final GetTaskBoardList getTaskBoardList = GetTaskBoardListMock();
  final TaskBoardListStateMapper taskBoardListStateMapper =
      TaskBoardListStateMapper();

  setUpAll(() {
    when(() => getTaskBoardList()).thenReturn(Result.success([]));
    sut = HomeViewModel(getTaskBoardList, taskBoardListStateMapper);
  });

  group("home view model tests", () {
    test('should call functions in init when view model start', () {
      verify(() => getTaskBoardList()).called(1);
    });

    group('taskBoardlistController tests', () {
      test('should emit a task board initial state', () {
        expectLater(
          sut.taskBoardlistController.stream,
          emitsAnyOf([
            isA<LoadingTaskBoardListState>(),
            isA<EmptyTaskBoardListState>()
          ]),
        );
      });
      test('should return a list of SuccessTaskBoardListState ', () {
        reset(getTaskBoardList);
        when(() => getTaskBoardList())
            .thenAnswer((_) => Result.success(taskBoardListmock));
        expect(
          sut.taskBoardlistController.stream,
          emitsAnyOf([
            isA<LoadingTaskBoardListState>(),
            isA<EmptyTaskBoardListState>()
          ]),
        );

        sut.handleIntent(HomeIntent.getAllTaskBoardList());

        expect(
          sut.taskBoardlistController.stream,
          emits(isA<SuccessTaskBoardListState>()),
        );

        verify(() => getTaskBoardList()).called(1);
      });

      test('should return a taskBoardListPresentation not empty', () {
        reset(getTaskBoardList);
        when(() => getTaskBoardList())
            .thenAnswer((_) => Result.success(taskBoardListmock));
        expect(
          sut.taskBoardlistController.stream,
          emitsAnyOf([
            isA<LoadingTaskBoardListState>(),
            isA<EmptyTaskBoardListState>()
          ]),
        );

        sut.handleIntent(HomeIntent.getAllTaskBoardList());

        expect(
          sut.taskBoardlistController.stream,
          emits(isA<SuccessTaskBoardListState>()),
        );

        sut.taskBoardlistController.stream.first.then((v) {
          if (v is SuccessTaskBoardListState) {
            expect(v.taskboardList.items.isNotEmpty, isTrue);
          }
        });

        verify(() => getTaskBoardList()).called(1);
      });
    });

    group('home view model handle intent tests', () {
      test('should receive a getTaskBoardListIntent and execute', () {
        reset(getTaskBoardList);
        when(() => getTaskBoardList()).thenReturn(Result.success([]));
        sut.handleIntent(HomeIntent.getAllTaskBoardList());

        verify(() => getTaskBoardList()).called(1);
      });

      test('should throw a NotImplementedIntent exception', () {
        expect(() => sut.handleIntent(HomeIntent.notImplemented()),
            throwsA(isA<IntentNotImplementdException>()));
      });
    });
  });
}
