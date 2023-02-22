part of '../../../app_widget.dart';

ThemeData get _lightThemeData => ThemeData(
      colorScheme: _lightColorScheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme(_lightColorScheme),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );

ThemeData get _darkThemeData => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: _appBarTheme(_darkColorScheme),
    );

AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
    centerTitle: true, backgroundColor: colorScheme.primaryContainer);
