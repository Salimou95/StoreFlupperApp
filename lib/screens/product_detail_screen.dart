import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/models/product.dart';
import 'package:store/services/product_api_service.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupérer l'ID du produit depuis le provider
    final productId = context.watch<ProductProvider>().productId;
    
    if (productId == null) {
      return const Center(child: Text('Aucun produit sélectionné'));
    }

    return FutureBuilder<Product>(
      future: ProductApiService().getProductById(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        }
        
        if (!snapshot.hasData) {
          return const Center(child: Text('Produit non trouvé'));
        }
        
        final product = snapshot.data!;
        
        return SingleChildScrollView(
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
    );
  }
}