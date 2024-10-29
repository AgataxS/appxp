import 'product.dart';

class Category {
  final String name;
  final String image;
  final List<Product> products;

  Category({required this.name, required this.image, required this.products});
}
