import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'about_us_screen.dart';
import 'product_detail_screen.dart';
import 'contact_form_screen.dart';
import 'product_list_screen.dart';
import 'customer_service_screen.dart'; 
import '../models/product.dart';
import '../models/category.dart';

class HomeScreen extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/images/offer1.png',
    'assets/images/offer2.png',
    'assets/images/offer3.png',
  ];

  final List<Product> featuredProducts = [
   
    Product(
      name: 'iPhone 12',
      image: 'assets/images/iphone12.png',
      priceUSD: 1000.0,
      details: 'El último iPhone con tecnología 5G y cámara mejorada.',
      features: [
        'Pantalla OLED de 6.1 pulgadas',
        'Chip A14 Bionic',
        'Doble cámara de 12MP',
        'Resistencia al agua IP68',
      ],
    ),
    Product(
      name: 'Samsung Galaxy S21',
      image: 'assets/images/galaxy_s21.png',
      priceUSD: 900.0,
      details: 'Smartphone de alta gama con pantalla AMOLED.',
      features: [
        'Pantalla Dynamic AMOLED de 6.2 pulgadas',
        'Exynos 2100',
        'Triple cámara de 12MP',
        'Compatible con 5G',
      ],
    ),
  
  ];

  final List<Category> categories = [

    Category(
      name: 'Laptops',
      image: 'assets/images/category_laptops.png',
      products: [
        Product(
          name: 'Portátil MSI',
          image: 'assets/images/laptop1.png',
          priceUSD: 1200.0,
          details: 'Portátil de alto rendimiento para juegos y trabajo.\n\nEspecificaciones:\n- Procesador Intel Core i7\n- 16GB RAM\n- 512GB SSD\n- Tarjeta gráfica NVIDIA RTX 3060',
          features: [
            'Pantalla de 15.6 pulgadas Full HD',
            'Teclado retroiluminado RGB',
            'Sistema de enfriamiento avanzado',
            'Audio de alta fidelidad',
          ],
        ),
        Product(
          name: 'Portátil Acer',
          image: 'assets/images/laptop2.png',
          priceUSD: 900.0,
          details: 'Portátil fiable y asequible para estudiantes.\n\nEspecificaciones:\n- Procesador Intel Core i5\n- 8GB RAM\n- 256GB SSD\n- Gráficos integrados Intel UHD',
          features: [
            'Batería de larga duración',
            'Diseño delgado y ligero',
            'Pantalla de 14 pulgadas HD',
            'Conectividad Wi-Fi 6',
          ],
        ),
        Product(
          name: 'Portátil ASUS',
          image: 'assets/images/laptop3.png',
          priceUSD: 1100.0,
          details: 'Portátil profesional con calidad de construcción premium.\n\nEspecificaciones:\n- Procesador AMD Ryzen 7\n- 16GB RAM\n- 1TB SSD\n- Gráficos AMD Radeon Vega',
          features: [
            'Chasis de aluminio',
            'Pantalla táctil',
            'Reconocimiento facial',
            'Carga rápida',
          ],
        ),
      ],
    ),
    Category(
      name: 'Cámaras',
      image: 'assets/images/category_cameras.png',
      products: [
        Product(
          name: 'Cámara HP',
          image: 'assets/images/camera1.png',
          priceUSD: 500.0,
          details: 'Cámara de alta resolución para fotografía impresionante.\n\nEspecificaciones:\n- Sensor de 24MP\n- Lente 18-55mm\n- Video Full HD\n- Wi-Fi integrado',
          features: [
            'Modo automático inteligente',
            'Pantalla abatible',
            'Disparo continuo de 5fps',
            'Compatibilidad con RAW',
          ],
        ),
        Product(
          name: 'Cámara Canon',
          image: 'assets/images/camera2.png',
          priceUSD: 700.0,
          details: 'Cámara versátil con excelente calidad de video.\n\nEspecificaciones:\n- Sensor de 30MP\n- Video 4K\n- Dual Pixel AF\n- Pantalla táctil',
          features: [
            'Conectividad Bluetooth y Wi-Fi',
            'Estabilización de imagen',
            'Disparo silencioso',
            'Intervalómetro integrado',
          ],
        ),
        Product(
          name: 'Cámara Nikon',
          image: 'assets/images/camera3.png',
          priceUSD: 800.0,
          details: 'Cámara compacta con funciones avanzadas.\n\nEspecificaciones:\n- Sensor APS-C de 20MP\n- Video 4K\n- Sistema de enfoque híbrido\n- Ranura dual para tarjetas SD',
          features: [
            'Visor electrónico OLED',
            'Cuerpo sellado contra el clima',
            'Modo de disparo HDR',
            'Personalización de botones',
          ],
        ),
      ],
    ),
    Category(
      name: 'Smartphones',
      image: 'assets/images/category_smartphones.png',
      products: [
        Product(
          name: 'iPhone 12',
          image: 'assets/images/iphone12.png',
          priceUSD: 1000.0,
          details: 'El último iPhone con tecnología 5G y cámara mejorada.\n\nEspecificaciones:\n- Pantalla OLED de 6.1 pulgadas\n- Chip A14 Bionic\n- 128GB de almacenamiento\n- iOS 14',
          features: [
            'Doble cámara de 12MP',
            'Modo Noche y Deep Fusion',
            'Carga inalámbrica MagSafe',
            'Resistencia al agua IP68',
          ],
        ),
        Product(
          name: 'Samsung Galaxy S21',
          image: 'assets/images/galaxy_s21.png',
          priceUSD: 900.0,
          details: 'Smartphone de alta gama con pantalla AMOLED.\n\nEspecificaciones:\n- Pantalla Dynamic AMOLED de 6.2 pulgadas\n- Exynos 2100\n- 256GB de almacenamiento\n- Android 11',
          features: [
            'Compatible con 5G',
            'Triple cámara de 12MP',
            'Grabación de video 8K',
            'Modo DeX inalámbrico',
          ],
        ),
        Product(
          name: 'Huawei P40',
          image: 'assets/images/huawei_p40.jpg',
          priceUSD: 800.0,
          details: 'Excelente cámara y rendimiento excepcional.\n\nEspecificaciones:\n- Pantalla OLED de 6.1 pulgadas\n- Kirin 990 5G\n- 128GB de almacenamiento\n- EMUI 10',
          features: [
            'Triple cámara Leica',
            'Zoom óptico 5x',
            'Carga rápida de 40W',
            'Reconocimiento facial y dactilar',
          ],
        ),
      ],
    ),
    Category(
      name: 'Accesorios',
      image: 'assets/images/category_accessories.png',
      products: [
        Product(
          name: 'Auriculares Bluetooth',
          image: 'assets/images/headphones.jpg',
          priceUSD: 150.0,
          details: 'Auriculares inalámbricos con cancelación de ruido.\n\nEspecificaciones:\n- Bluetooth 5.0\n- Autonomía de 30 horas\n- Asistentes de voz integrados\n- Carga rápida USB-C',
          features: [
            'Sonido Hi-Fi',
            'Diseño plegable',
            'Controles táctiles',
            'Modo ambiente',
          ],
        ),
        Product(
          name: 'Mouse Gamer',
          image: 'assets/images/mouse.jpeg',
          priceUSD: 80.0,
          details: 'Mouse con alta precisión y luces RGB.\n\nEspecificaciones:\n- Sensor óptico de 16,000 DPI\n- 8 botones programables\n- Iluminación RGB personalizable\n- Memoria integrada',
          features: [
            'Peso ajustable',
            'Tasa de sondeo de 1000Hz',
            'Compatible con software de macros',
            'Cable trenzado resistente',
          ],
        ),
        Product(
          name: 'Teclado Mecánico',
          image: 'assets/images/keyboard.jpg',
          priceUSD: 120.0,
          details: 'Teclado mecánico con retroiluminación personalizable.\n\nEspecificaciones:\n- Switches mecánicos Blue\n- Anti-ghosting completo\n- Retroiluminación RGB por tecla\n- Reposamuñecas desmontable',
          features: [
            'Construcción de aluminio',
            'Controles multimedia dedicados',
            'Compatible con Windows y macOS',
            'Cable USB desmontable',
          ],
        ),
      ],
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distribol'),
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
            ExpansionTile(
              leading: Icon(Icons.category),
              title: Text('Categorías'),
              children: categories.map((category) {
                return ListTile(
                  title: Text(category.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductListScreen(
                          products: category.products,
                          categoryName: category.name,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
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
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contáctanos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactFormScreen()),
                );
              },
            ),
            ExpansionTile(
              leading: Icon(Icons.support_agent),
              title: Text('Atención al Cliente'),
              children: [
                ListTile(
                  leading: Icon(Icons.build),
                  title: Text('Solicitar Técnico'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerServiceScreen()),
                    );
                  },
                ),
              
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
       
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 3),
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
            ),
            items: carouselImages.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Productos Destacados',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: featuredProducts.length,
              itemBuilder: (context, index) {
                final product = featuredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.name,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            'Precio: \$${product.priceUSD}',
                            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
