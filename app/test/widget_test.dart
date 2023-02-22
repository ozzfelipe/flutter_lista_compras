// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_compras/app_module.dart';
import 'package:lista_de_compras/app_widget.dart';
import 'package:lista_de_compras/src/home/home_module.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  initModules([AppModule(), HomeModule()]);
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AppWidget());
  });
}
