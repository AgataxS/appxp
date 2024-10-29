import 'package:flutter/material.dart';
import '../models/product.dart';
import 'loan_calculator_screen.dart';
import 'form_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  double getPriceInBs() {
    return product.priceUSD * 6.96;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
              'Precio: \$${product.priceUSD} / Bs ${getPriceInBs().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 22, color: colorScheme.primary),
            ),
            SizedBox(height: 16),
         
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Características:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            ...product.features.map((feature) => ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text(feature),
                )),
            SizedBox(height: 16),
            
            Text(
              product.details,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
          
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.calculate),
                  label: Text('Calcular Cuotas'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoanCalculatorScreen(
                          priceInBs: getPriceInBs(),
                          productName: product.name,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, 
                  ),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.shopping_cart),
                  label: Text('Comprar'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FormScreen(action: 'Comprar', product: product),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, 
                  ),
                ),
              
              ],
            ),
          ],
        ),
      ),
    );
  }
}
