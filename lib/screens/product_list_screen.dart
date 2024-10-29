import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products;
  final String categoryName;

  ProductListScreen({required this.products, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos - $categoryName'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(product.image, fit: BoxFit.cover, width: double.infinity),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Precio: Bs ${product.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
