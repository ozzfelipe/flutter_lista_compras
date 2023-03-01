part of '../../../app_widget.dart';

ThemeData get _lightThemeData => ThemeData(
      colorScheme: _lightColorScheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme(_lightColorScheme),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
      segmentedButtonTheme: _segmentdButtonTheme,
    );

ThemeData get _darkThemeData => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: _appBarTheme(_darkColorScheme),
      segmentedButtonTheme: _segmentdButtonTheme,
    );

AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
    centerTitle: true, backgroundColor: colorScheme.primaryContainer);

SegmentedButtonThemeData get _segmentdButtonTheme =>
    SegmentedButtonThemeData(style:
        ButtonStyle(textStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const TextStyle(
          fontSize: 9,
        );
      }
      return const TextStyle(
        fontSize: 11,
      );
    })));
