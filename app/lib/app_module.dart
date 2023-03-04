import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/configuration/configuration_page.dart';
import 'package:lista_de_compras/src/home/home_module.dart';
import 'package:lista_de_compras/src/shared/data/local/configuration_service_local.dart';
import 'package:lista_de_compras/src/shared/data/local/configuration_service_local_interface.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/get_last_sync_date_local.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/get_theme_mode_local.dart';
import 'package:lista_de_compras/src/shared/domain/app/data/local/save_theme_mode_local.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_view_model.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/sync_date_mapper.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/sync_date_state_mapper.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_last_sync_date.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_last_sync_date_source.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/get_theme_mode_source.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/usecases/save_theme_mode_source.dart';
import 'package:lista_de_compras/src/shared/services/realm/realm_config.dart';
import 'package:realm/realm.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.instance<Realm>(Realm(realmConfig)),
        Bind.factory((i) => SyncDatePresentationMapper()),
        Bind.factory((i) => SyncDateStateMapper(i())),
        Bind.singleton<IConfigurationServiceLocal>(
            (i) => ConfigurationServiceLocal(i())),
        Bind.factory<SaveThemeModeSource>((i) => SaveThemeModeLocal(i())),
        Bind.factory<GetThemeModeSource>((i) => GetThemeModeLocal(i())),
        Bind.factory<GetLastSyncDateSource>((i) => GetLastSyncDateLocal(i())),
        Bind.factory((i) => GetLastSyncDate(i())),
        Bind.factory((i) => GetThemeMode(i())),
        Bind.factory((i) => SaveThemeMode(i())),
        Bind.singleton((i) => AppViewModel(i(), i(), i(), i())),
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
