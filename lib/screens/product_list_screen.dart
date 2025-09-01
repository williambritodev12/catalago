// lib/screens/product_list_screen.dart
import 'package:catalogo_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_app/models/product.dart'; // Importa o modelo de produto
import 'package:catalogo_app/data/product_repository.dart'; // Importa o repositório de dados

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> _productsFuture;
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _productsFuture = _fetchProducts();
  }

  Future<List<Product>> _fetchProducts() async {
    // Buscar dados da internet é uma capacidade fundamental [4, 7]
    final products = await ProductRepository().fetchProducts();
    setState(() {
      _allProducts = products;
      _filteredProducts = products;
    });
    return products;
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _allProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()) ||
              product.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar produtos...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.deepPurple.shade50,
              ),
              onChanged: _filterProducts, // Lidar com mudanças no texto [4]
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Erro ao carregar produtos: ${snapshot.error}'));
          } else if (!snapshot.hasData || _filteredProducts.isEmpty) {
            return const Center(child: Text('Nenhum produto encontrado.'));
          } else {
            // Criação de lista com diferentes tipos de itens [4] ou grades [4]
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return ProductCard(
                    product: product); // Um widget de cartão para cada produto
              },
            );
          }
        },
      ),
    );
  }
}
