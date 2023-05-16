import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/home/data/local/task_board_list_service_interface.dart';
import 'package:lista_de_compras/src/home/data/local/task_board_list_service_local.dart';
import 'package:lista_de_compras/src/home/domain/presentation/mappers/task_board_list_state_mapper.dart';
import 'package:lista_de_compras/src/home/pages/home/home_page.dart';
import 'package:lista_de_compras/src/home/pages/home/home_view_model.dart';
import 'package:lista_de_compras/src/home/pages/new_task/new_task_board_page.dart';
import 'package:lista_de_compras/src/shared/utils/routes/routes.dart';

import 'domain/data/local/task_board_source_local.dart';
import 'domain/presentation/usecases/get_task_board_list_usecase.dart';
import 'domain/presentation/usecases/task_board_list_source_interface.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        AutoBind.lazySingleton<ITaskBoardServiceLocal>(
            TaskBoardServicelocal.new),
        AutoBind.lazySingleton<ITaskBoardListSource>(TaskBoardListLocal.new),
        AutoBind.lazySingleton(GetTaskBoardList.new),
        AutoBind.lazySingleton(TaskBoardListStateMapper.new),
        AutoBind.lazySingleton(HomeViewModel.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute(Routes.newTask,
            child: (context, args) => const NewTaskBoardPage()),
      ];
}
