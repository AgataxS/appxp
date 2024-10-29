import 'package:flutter/material.dart';
import '../models/product.dart';
import 'loan_calculator_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Producto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(product.image, height: 250),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              'Precio: Bs ${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 22, color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 16),
            Text(
              product.details,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.calculate),
              label: Text('Calcular Cuotas'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoanCalculatorScreen(price: product.price, productName: product.name),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
