import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/shared/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

var realmConfig = Configuration.local(
  [ConfigurationModel.schema],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel(ThemeMode.system.name));
  },
);
