import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'categories_screen.dart';
import 'about_us_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/images/offer1.png',
    'assets/images/offer2.png',
    'assets/images/offer3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EcoMercio'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categorías'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Acerca de Nosotros'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Carrusel de imágenes
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
            ),
            items: carouselImages.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          // Botones de navegación
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildNavItem(
                  context,
                  Icons.category,
                  'Categorías',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoriesScreen()),
                    );
                  },
                ),
                _buildNavItem(
                  context,
                  Icons.info,
                  'Acerca de Nosotros',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 70, color: Theme.of(context).colorScheme.primary),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
