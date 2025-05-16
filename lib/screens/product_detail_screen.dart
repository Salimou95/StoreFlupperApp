// ! Page crée par salimou
import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/services/product_api_service.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product; // l'objet reçu depuis la navigation

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Future<Product> productDetails;

  @override
  void initState() {
    super.initState();
    // Recharge les détails complets du produit
    productDetails = ProductApiService().getProductById(widget.product.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails du produit')),
      body: FutureBuilder<Product>(
        future: productDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }

          final product = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.images != null && product.images!.isNotEmpty)
                  Image.network(product.images!.first, height: 200),
                const SizedBox(height: 16),
                Text(product.title ?? '', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text('${product.price ?? ''} €', style: const TextStyle(fontSize: 20, color: Colors.green)),
                const SizedBox(height: 16),
                Text(product.description ?? '', style: const TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}
