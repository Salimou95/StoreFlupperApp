//! fichier cart provider : salimou
import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
 
class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];
 
  List<Product> get cartItems => _cartItems;
 
  void addToCart(Product product) {
    print("Adding to cart: ${product.title}");
    _cartItems.add(product);
    print("Cart now has ${_cartItems.length} items");
    notifyListeners();
  }
 
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
 
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
 