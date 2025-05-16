import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store/models/category.dart';
import 'package:store/models/product.dart';

class ProductApiService {
  // Récupérer un produit par son ID
  Future<Product> getProductById(int productId) async {
    Uri url = Uri.parse('https://api.escuelajs.co/api/v1/products/$productId');
    
    http.Response response = await http.get(url);
    
    if (response.statusCode == 200) {
      // Décodage des données JSON
      Map<String, dynamic> data = jsonDecode(response.body);
      
      return Product(
        id: data['id'],
        title: data['title'],
        slug: data['slug'],
        price: data['price'],
        description: data['description'],
        category: Category(
          id: data['category']['id'],
          name: data['category']['name'],
          slug: data['category']['slug'],
          image: data['category']['image'],
        ),
        images: data['images'],
      );
    }
    
    throw Error();
  }
  
  // Récupérer des produits similaires (même catégorie)
  Future<List<Product>> getSimilarProducts(int categoryId, int currentProductId) async {
    Uri url = Uri.parse(
      'https://api.escuelajs.co/api/v1/categories/$categoryId/products',
    );
    
    http.Response response = await http.get(url);
    
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      
      return data
          .where((product) => product['id'] != currentProductId) // Exclure le produit actuel
          .map<Product>((product) {
            return Product(
              id: product['id'],
              title: product['title'],
              slug: product['slug'],
              price: product['price'],
              description: product['description'],
              category: Category(
                id: product['category']['id'],
                name: product['category']['name'],
                slug: product['category']['slug'],
                image: product['category']['image'],
              ),
              images: product['images'],
            );
          })
          .toList();
    }
    
    throw Error();
  }
}