import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecomercio_app/main.dart';

void main() {
  testWidgets('Verifica la pantalla principal', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verifica que el título esté presente
    expect(find.text('EcoMercio - Productos'), findsOneWidget);
  });
}
