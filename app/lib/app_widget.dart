import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_theme_state.dart';
import 'package:lista_de_compras/src/shared/domain/app/presentation/app_view_model.dart';

part './src/shared/themes/color_schemes.g.dart';
part './src/shared/themes/theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  AppViewModel appViewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppThemeState>(
      stream: appViewModel.appThemeController.stream,
      builder: (context, snapshot) {
        return MaterialApp.router(
          title: 'Lista de Compras',
          debugShowCheckedModeBanner: false,
          theme: _lightThemeData,
          darkTheme: _darkThemeData,
          themeMode: snapshot.data?.themeMode,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        );
      },
    );
  }
}
