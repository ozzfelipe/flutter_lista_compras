import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/home/home_page.dart';

part './src/shared/themes/color_schemes.g.dart';
part './src/shared/themes/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      debugShowCheckedModeBanner: false,
      theme: _lightThemeData,
      darkTheme: _darkThemeData,
      home: const HomePage(),
    );
  }
}
