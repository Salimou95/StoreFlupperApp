class Category {
  int? id;
  String? name, slug, image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  // Constructeur pour créer une Category à partir d'un JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }

  // Méthode pour convertir une Category en JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'slug': slug, 'image': image};
  }
}
