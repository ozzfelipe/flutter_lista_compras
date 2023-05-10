import 'package:realm/realm.dart';

part 'task_board_model.dart';
part 'task_model.g.dart';

@RealmModel()
class _Task {
  @PrimaryKey()
  late Uuid id;
  late String description;
  bool complete = false;
}
