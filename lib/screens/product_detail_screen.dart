import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/models/product.dart';

import 'package:store/providers/cart_provider.dart';


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
              // Image du produit
              if (product.images != null && product.images!.isNotEmpty)
                Image.network(product.images!.first, height: 200),
              
              const SizedBox(height: 16),
              
              // Titre et actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.title ?? '', 
                      style: Theme.of(context).textTheme.headlineSmall
                    ),
                  ),
                  // Boutons d'action
                  Row(
                    children: [
                      // ? Ajout de l'icône de favoris : Keziah
                      IconButton(
                        onPressed: () {
                          print('favori');
                        },
                        icon: const Icon(Icons.favorite),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false).addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Produit ajouté au panier')),
                          );
                        },
                        icon: const Icon(Icons.shopping_cart),
                      ),
                    ],
                  ),
                ],
              ),
              
              // Prix
              Text(
                '${product.price ?? ''} €', 
                style: const TextStyle(fontSize: 20, color: Colors.green)
              ),
              
              const SizedBox(height: 16),
              
              // Description
              Text(
                product.description ?? '', 
                style: const TextStyle(fontSize: 16)
              ),
            ],
          ),
        );
      },
    );
  }
}