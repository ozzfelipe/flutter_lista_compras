import 'package:lista_de_compras/src/shared/services/realm/models/configuration_model.dart';

abstract class IConfigurationServiceLocal {
  ConfigurationModel getConfiguration();
  void saveThemeMode(String themeModeName);
  void saveSyncDate(DateTime syncDate);
  void deleteAll();
}
