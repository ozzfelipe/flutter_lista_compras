class AppSyncDateState {
  AppSyncDateState._();

  factory AppSyncDateState.success(DateTime syncDate) =>
      SuccessSyncDateState(syncDate);
  factory AppSyncDateState.empty() => EmptySyncDateState();
}

class SuccessSyncDateState extends AppSyncDateState {
  DateTime syncDate;
  SuccessSyncDateState(this.syncDate) : super._();
}

class EmptySyncDateState extends AppSyncDateState {
  EmptySyncDateState() : super._();
}
