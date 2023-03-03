import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/configuration/configuration_page.dart';
import 'package:lista_de_compras/src/home/home_module.dart';
import 'package:lista_de_compras/src/shared/view_models/app_view_model/app_view_model.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AppViewModel()),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        )
      ];
}
