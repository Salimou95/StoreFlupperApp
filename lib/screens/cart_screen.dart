// ! page cart screen : salimou
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart';
 
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    // Utilisation du provider pour accéder au panier
    final cart = Provider.of<CartProvider>(context);
    print("Cart items count: ${cart.cartItems.length}");
 
    if (cart.cartItems.isEmpty) {
      return const Center(child: Text('Votre panier est vide.'));
    }
 
    // Utiliser LayoutBuilder pour résoudre les problèmes de layout
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Votre Panier',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                // Utiliser ListView normal (pas dans un Expanded)
                ListView.builder(
                  // Ces deux lignes sont cruciales pour résoudre ton problème
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cart.cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cart.cartItems[index];
                    print("Building item: ${product.title}");
 
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: product.images != null && product.images!.isNotEmpty
                            ? Image.network(
                                product.images!.first,
                                width: 50,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.image_not_supported),
                              )
                            : const Icon(Icons.shopping_bag),
                        title: Text(product.title ?? 'Produit sans nom'),
                        subtitle: Text('${product.price ?? 0} €'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cart.removeFromCart(product);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}