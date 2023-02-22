import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part './src/shared/themes/color_schemes.g.dart';
part './src/shared/themes/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lista de Compras',
      debugShowCheckedModeBanner: false,
      theme: _lightThemeData,
      darkTheme: _darkThemeData,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
