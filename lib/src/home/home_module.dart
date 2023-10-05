import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/app_module.dart';
import 'package:lista_de_compras/src/home/data/local/task_board_list_service_interface.dart';
import 'package:lista_de_compras/src/home/data/local/task_board_list_service_local.dart';
import 'package:lista_de_compras/src/home/domain/presentation/mappers/task_board_list_state_mapper.dart';
import 'package:lista_de_compras/src/home/pages/home/home_page.dart';
import 'package:lista_de_compras/src/home/pages/home/home_view_model.dart';
import 'package:lista_de_compras/src/home/pages/new_task/new_task_board_page.dart';
import 'package:lista_de_compras/src/shared/utils/routes/routes.dart';

import 'domain/data/local/task_board_list_source_interface.dart';
import 'domain/data/local/task_board_source_local.dart';
import 'domain/presentation/usecases/get_task_board_list_usecase.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<ITaskBoardServiceLocal>(TaskBoardServicelocal.new);
    i.addLazySingleton<ITaskBoardListSource>(TaskBoardListLocal.new);
    i.add(GetTaskBoardList.new);
    i.add(TaskBoardListStateMapper.new);
    i.addSingleton(HomeViewModel.new);
    super.binds(i);
  }

  @override
  List<Module> get imports => [AppModule()];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
    r.child(Routes.newTask,
        child: (
          context,
        ) =>
            const NewTaskBoardPage());
    super.routes(r);
  }
}
