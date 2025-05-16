import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store/models/product.dart';

class ProductApiService {
  Future<Product> getProductById(int id) async {
    final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erreur de chargement du produit');
    }
  }
}
