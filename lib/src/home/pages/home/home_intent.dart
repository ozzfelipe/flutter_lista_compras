sealed class HomeIntent {
  HomeIntent._();

  factory HomeIntent.getAllTaskBoardList() => GetAllTaskBoardListIntent();
  factory HomeIntent.notImplemented() => NotImplementedIntent();
}

class GetAllTaskBoardListIntent extends HomeIntent {
  GetAllTaskBoardListIntent() : super._();
}

class NotImplementedIntent extends HomeIntent {
  NotImplementedIntent() : super._();
}
