import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/shared/view_models/app_view_model/app_theme_state.dart';
import 'package:lista_de_compras/src/shared/view_models/app_view_model/app_view_model.dart';

part './src/shared/themes/color_schemes.g.dart';
part './src/shared/themes/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppViewModel appViewModel = Modular.get();
    return StreamBuilder<AppThemeState>(
      stream: appViewModel.appThemeController.stream,
      builder: (context, snapshot) => MaterialApp.router(
        title: 'Lista de Compras',
        debugShowCheckedModeBanner: false,
        theme: _lightThemeData,
        darkTheme: _darkThemeData,
        themeMode: snapshot.data?.themeMode,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
