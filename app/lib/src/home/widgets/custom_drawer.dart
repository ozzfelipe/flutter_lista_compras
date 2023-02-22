import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(children: [
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
            Text(
              '22/02/2023 às 17:00',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.settings),
        label: Text('Configurações'),
      ),
    ]);
  }
}
