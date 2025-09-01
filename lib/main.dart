// main.dart
import 'package:flutter/material.dart';
import 'package:catalogo_app/screens/product_list_screen.dart'; // Importe sua tela de lista de produtos

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo Inovador',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Um tema para seu design único [4]
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat', // Exemplo de fonte customizada [4]
      ),
      home: const ProductListScreen(),
    );
  }
}
