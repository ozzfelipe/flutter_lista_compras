import 'package:lista_de_compras/src/shared/domain/app/presentation/sync_date_presentation.dart';

class AppSyncDateState {
  AppSyncDateState._();

  factory AppSyncDateState.success(SyncDatePresentation syncDate) =>
      SuccessSyncDateState(syncDate);
  factory AppSyncDateState.empty() => EmptySyncDateState();
}

class SuccessSyncDateState extends AppSyncDateState {
  SyncDatePresentation syncDate;
  SuccessSyncDateState(this.syncDate) : super._();
}

class EmptySyncDateState extends AppSyncDateState {
  EmptySyncDateState() : super._();
}
