import 'package:store/models/category.dart';

class Product {
  int? id;
  num? price;
  String? title, slug, description;
  Category category;
  List<dynamic>? images;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  // Constructeur pour créer un Product à partir d'un JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      price: json['price'],
      description: json['description'],
      category: Category.fromJson(json['category']),
      images: json['images'] != null ? List<dynamic>.from(json['images']) : [],
    );
  }

  // Méthode pour convertir un Product en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'price': price,
      'description': description,
      'category': category.toJson(),
      'images': images,
    };
  }
}
