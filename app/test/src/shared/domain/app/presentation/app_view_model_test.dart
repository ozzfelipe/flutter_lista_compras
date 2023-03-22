import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_intent.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_sync_date_state.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_theme_state.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_view_model.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/exceptions/exceptions.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/mappers/sync_date_presentation_mapper.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/mappers/sync_date_state_mapper.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_last_sync_date.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

class SaveThemeModeMock extends Mock implements SaveThemeMode {}

class GetThemeModeMock extends Mock implements GetThemeMode {}

class GetLastSyncDateMock extends Mock implements GetLastSyncDate {}

void main() {
  final SaveThemeMode saveThemeMode = SaveThemeModeMock();
  final GetThemeMode getThemeMode = GetThemeModeMock();
  final GetLastSyncDate getLastSyncDate = GetLastSyncDateMock();
  late final AppViewModel sut;

  var syncDateMock = DateTime.now();

  setUpAll(() {
    registerFallbackValue(ThemeMode.dark);

    when(() => getThemeMode()).thenReturn(ThemeMode.system);
    when(() => getLastSyncDate()).thenReturn(Result.success(syncDateMock));

    sut = AppViewModel(
      saveThemeMode,
      getThemeMode,
      SyncDateStateMapper(SyncDatePresentationMapper()),
      getLastSyncDate,
    );
  });

  group('app view model tests', () {
    test('should call functions in init when view model start', () {
      verify(() => getLastSyncDate()).called(1);
      verify(() => getThemeMode()).called(1);
    });
    group('appThemeController tests', () {
      test('should emit app theme state', () {
        expect(
          sut.appThemeController.stream,
          emits(AppThemeState(ThemeMode.system)),
        );
      });
      test('should update theme mode', () {
        expect(
          sut.appThemeController.stream,
          emits(AppThemeState(ThemeMode.system)),
        );

        sut.handleIntent(SetThemeModeIntent(ThemeMode.dark));

        expect(
          sut.appThemeController.stream,
          emits(AppThemeState(ThemeMode.dark)),
        );

        var verifyResult = verify(() => saveThemeMode(captureAny()));
        verifyResult.called(1);
        expect(verifyResult.captured.last, equals(ThemeMode.dark));
      });
    });
    group('appSyncDateController tests', () {
      test('should emit success sync date theme state', () {
        expect(
          sut.appSyncDateController.stream,
          emits(isA<SuccessSyncDateState>()),
        );
      });
      test('should emit empty sync date theme state', () {
        when(() => getLastSyncDate()).thenReturn(Result.failure(Exception()));

        sut.handleIntent(GetLastSyncDateIntent());

        expect(
          sut.appSyncDateController.stream,
          emits(isA<EmptySyncDateState>()),
        );
      });
    });
    group('view model handle intent tests', () {
      test('should receive a SetThemeModeIntent and execute', () {
        when(() => saveThemeMode(any()));
        sut.handleIntent(SetThemeModeIntent(ThemeMode.dark));

        var verifyResult = verify(() => saveThemeMode(captureAny()));
        verifyResult.called(1);
        expect(verifyResult.captured.first, ThemeMode.dark);
      });
      test('should receive a GetLastSyncDateIntent and execute', () {
        sut.handleIntent(GetLastSyncDateIntent());

        verify(() => getLastSyncDate()).called(2);
      });
      test('should throw a NotImplementedIntent exception', () {
        expect(() => sut.handleIntent(NotImplementedIntent()),
            throwsA(isA<AppIntentNotImplementdException>()));
      });
    });
  });
}
