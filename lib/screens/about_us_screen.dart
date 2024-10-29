import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  final String aboutText = '''
EcoMercio es una aplicación dedicada a ofrecer los mejores productos electrónicos a precios competitivos. Nuestro objetivo es brindar a nuestros clientes una experiencia de compra excepcional, con atención personalizada y productos de alta calidad.

Contamos con una amplia variedad de productos en diferentes categorías para satisfacer todas tus necesidades tecnológicas.

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
