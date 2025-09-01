// lib/models/product.dart
// Definindo o modelo de um produto com Dart, uma linguagem de "tipagem forte" [2]
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Construtor factory para criar um Product a partir de um mapa JSON
  // JSON serialization é um recurso essencial [4, 7]
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as double,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
