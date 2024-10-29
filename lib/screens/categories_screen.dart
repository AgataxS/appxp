import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_list_screen.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Laptops',
      'products': [
        Product(
          name: 'Portátil MSI',
          image: 'assets/images/laptop1.png',
          price: 1200.0,
          details: 'Portátil de alto rendimiento para juegos y trabajo.',
        ),
        Product(
          name: 'Portátil Acer',
          image: 'assets/images/laptop2.png',
          price: 1400.0,
          details: 'Portátil fiable y asequible para estudiantes.',
        ),
        Product(
          name: 'Portátil ASUS',
          image: 'assets/images/laptop3.png',
          price: 1600.0,
          details: 'Portátil profesional con calidad de construcción premium.',
        ),
      ],
    },
    {
      'name': 'Cámaras',
      'products': [
        Product(
          name: 'Cámara HP',
          image: 'assets/images/camera1.png',
          price: 500.0,
          details: 'Cámara de alta resolución para fotografía impresionante.',
        ),
        Product(
          name: 'Cámara Canon',
          image: 'assets/images/camera2.png',
          price: 700.0,
          details: 'Cámara versátil con excelente calidad de video.',
        ),
        Product(
          name: 'Cámara Nikon',
          image: 'assets/images/camera3.png',
          price: 800.0,
          details: 'Cámara compacta con funciones avanzadas.',
        ),
      ],
    },
    // Agrega más categorías según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.category, color: Theme.of(context).colorScheme.primary),
              title: Text(
                categories[index]['name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListScreen(
                      products: categories[index]['products'],
                      categoryName: categories[index]['name'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
