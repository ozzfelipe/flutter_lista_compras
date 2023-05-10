import 'package:lista_de_compras/src/shared/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

import 'configuration_service_local_interface.dart';

class ConfigurationServiceLocal extends IConfigurationServiceLocal {
  final Realm _realm;

  ConfigurationServiceLocal(this._realm);

  @override
  void saveThemeMode(String themeModeName) {
    var model = getConfiguration();
    _realm.write(() => model.themeModeName = themeModeName);
  }

  @override
  ConfigurationModel getConfiguration() {
    return _realm.all<ConfigurationModel>().first;
  }

  @override
  void deleteAll() {
    // TODO: implement deleteAll
  }

  @override
  void saveSyncDate(DateTime syncDate) {
    // TODO: implement saveSyncDate
  }
}
