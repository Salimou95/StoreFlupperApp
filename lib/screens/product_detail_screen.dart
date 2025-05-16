// ! Page crée par salimou
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? 'Détail produit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.images != null && product.images!.isNotEmpty)
              Image.network(product.images!.first, height: 200),
            const SizedBox(height: 16),

            // ? Ajout de l'icône de favoris : Keziah
            IconButton(
              onPressed: () {
                print('favori');
              },
              icon: Icon(Icons.favorite),
            ),
            // ! creation de l'action du panier : salimou
            IconButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Produit ajouté au panier')),
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
            // ? /////////////////

            Text(product.title ?? '', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('${product.price ?? ''} €', style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 16),
            Text(product.description ?? '', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}