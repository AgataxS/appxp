import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoMercio App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(
          secondary: Colors.purple,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
