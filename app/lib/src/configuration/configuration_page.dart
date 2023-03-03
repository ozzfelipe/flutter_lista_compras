import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/shared/view_models/app_view_model/app_intent.dart';

import '../shared/themes/extensions/theme_mode_extension.dart';
import '../shared/view_models/app_view_model/app_view_model.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final AppViewModel _appViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    // final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Compras',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style:
                  textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Text(
              'Tema',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            StreamBuilder(
                stream: _appViewModel.appThemeController.stream,
                builder: (context, snapshoot) {
                  return Column(
                    children: [
                      ...ThemeMode.values
                          .map((e) => RadioListTile<ThemeMode>(
                                value: e,
                                groupValue: snapshoot.data?.themeMode,
                                onChanged: (v) => _appViewModel
                                    .handleIntent(AppIntent.setThemeMode(v!)),
                                title: Text(e.getTitle()),
                              ))
                          .toList()
                    ],
                  );
                }),
            const SizedBox(height: 30),
            Text(
              'Controle de dados',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Apagar cache e reiniciar app'),
            ),
          ],
        ),
      ),
    );
  }
}
