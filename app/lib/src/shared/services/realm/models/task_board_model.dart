part of './task_model.dart';

@RealmModel()
class _TaskBoard {
  @PrimaryKey()
  late Uuid id;
  late String title;
  late List<_Task> tasks;
  bool enable = true;
}
