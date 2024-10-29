import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  final String aboutText = '''
Distribol es una empresa líder en distribución de productos electrónicos de alta calidad. Ofrecemos una amplia gama de productos, desde smartphones y laptops hasta accesorios y equipos especializados.

Nuestra misión es brindar la mejor experiencia de compra a nuestros clientes, con atención personalizada y servicios de valor añadido como asistencia técnica y planes de financiamiento.

¡Gracias por confiar en nosotros!
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de Nosotros'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          aboutText,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
