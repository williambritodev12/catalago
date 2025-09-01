// lib/data/product_repository.dart
import 'dart:convert'; // Para decodificar JSON [7]
import 'package:flutter/services.dart'
    show rootBundle; // Para carregar um arquivo local (simulando API)
import 'package:catalogo_app/models/product.dart';

class ProductRepository {
  // Simula a busca de dados de uma API externa usando um arquivo JSON local.
  // A busca real de dados da internet usaria pacotes como 'http'.
  // O Dart é otimizado para programação assíncrona com 'async' e 'await' [8, 9].
  Future<List<Product>> fetchProducts() async {
    // Simula um atraso de rede
    await Future.delayed(const Duration(seconds: 2));

    // Carrega o conteúdo do arquivo JSON
    // Em um cenário real, você faria uma requisição HTTP aqui.
    final String response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data =
        json.decode(response); // Decodificação JSON [4, 7]

    // Mapeia os dados JSON para uma lista de objetos Product
    return data.map((json) => Product.fromJson(json)).toList();
  }
}
