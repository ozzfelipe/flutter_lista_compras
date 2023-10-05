import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/configuration/configuration_page.dart';
import 'package:lista_de_compras/src/home/home_module.dart';
import 'package:lista_de_compras/src/shared/data/local/configuration_service_local.dart';
import 'package:lista_de_compras/src/shared/data/local/configuration_service_local_interface.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/get_last_sync_date_local.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/get_theme_mode_local.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/save_theme_mode_local.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_view_model.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/mappers/sync_date_presentation_mapper.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/mappers/sync_date_state_mapper.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/mappers/theme_mode_state_mapper.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_last_sync_date.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_last_sync_date_source.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode_source.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode_source.dart';
import 'package:lista_de_compras/src/shared/services/realm/realm_config.dart';
import 'package:lista_de_compras/src/shared/utils/routes/routes.dart';
import 'package:realm/realm.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<Realm>(Realm(realmConfig));
    i.add(SyncDatePresentationMapper.new);
    i.add(SyncDateStateMapper.new);
    i.add(ThemeModeStateMapper.new);
    i.addSingleton<IConfigurationServiceLocal>(ConfigurationServiceLocal.new);
    i.add<SaveThemeModeSource>(SaveThemeModeLocal.new);
    i.add<GetThemeModeSource>(GetThemeModeLocal.new);
    i.add<GetLastSyncDateSource>(GetLastSyncDateLocal.new);
    i.add(GetLastSyncDate.new);
    i.add(GetThemeMode.new);
    i.add(SaveThemeMode.new);
    i.addSingleton(AppViewModel.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
    r.child(
      Routes.configuration,
      child: (context) => const ConfigurationPage(),
    );
    super.routes(r);
  }
}
