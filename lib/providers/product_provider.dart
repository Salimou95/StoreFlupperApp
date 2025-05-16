import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  int? _productId;

  int? get productId => _productId;

  void setProductId(int id) {
    _productId = id;
    notifyListeners();
  }
}