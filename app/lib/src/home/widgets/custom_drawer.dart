import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_view_model.dart';
import 'package:lista_de_compras/src/shared/routes/routes.dart';

import '../../shared/domain/app/presentation/app_sync_date_state.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final AppViewModel _appViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) Modular.to.popAndPushNamed('./${Routes.configuration}');
      },
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sincronizar'),
              StreamBuilder<AppSyncDateState>(
                  stream: _appViewModel.appSyncDateController,
                  builder: (context, snapshot) {
                    if (snapshot.data is SuccessSyncDateState) {
                      SuccessSyncDateState syncState =
                          snapshot.data as SuccessSyncDateState;
                      return Text(
                        syncState.syncDatePresentation.syncDate,
                        style: Theme.of(context).textTheme.labelSmall,
                      );
                    }
                    return Text(
                      'Não  sincronizado',
                      style: Theme.of(context).textTheme.labelSmall,
                    );
                  }),
            ],
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
