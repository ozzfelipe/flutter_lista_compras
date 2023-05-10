import 'package:lista_de_compras/src/shared/domain/app/presentation/sync_date_presentation.dart';

class AppSyncDateState {
  AppSyncDateState._();

  factory AppSyncDateState.success(SyncDatePresentation syncDate) =>
      SuccessSyncDateState(syncDate);
  factory AppSyncDateState.empty() => EmptySyncDateState();
}

class SuccessSyncDateState extends AppSyncDateState {
  SyncDatePresentation syncDatePresentation;
  SuccessSyncDateState(this.syncDatePresentation) : super._();
}

class EmptySyncDateState extends AppSyncDateState {
  EmptySyncDateState() : super._();
}
