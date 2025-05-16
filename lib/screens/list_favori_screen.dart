// ? Creation de la page de liste des favoris : Keziah

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListFavoriScreen extends StatefulWidget {
  const ListFavoriScreen({super.key});

  @override
  State<ListFavoriScreen> createState() => _ListFavoriScreenState();
}

class _ListFavoriScreenState extends State<ListFavoriScreen> {
  List<Map<String, String>> favoris = [];

  @override
  void initState() {
    super.initState();
    _loadFavoris();
  }
 // ? Affichage de la liste des favoris : Keziah
  Future<void> _loadFavoris() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList('favoris') ?? [];
    List<Map<String, String>> favs = [];
    for (final id in ids) {
      final title = prefs.getString('favori_title_$id') ?? 'Produit sans nom';
      final image = prefs.getString('favori_image_$id') ?? '';
      final price = prefs.getString('favori_price_$id') ?? '0';
      favs.add({
        'id': id,
        'title': title,
        'image': image,
        'price': price,
      });
    }
    setState(() {
      favoris = favs;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (favoris.isEmpty) {
      return Center(
        child: Text(
          'Aucun favori pour le moment.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Vos Favoris',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: favoris.length,
              itemBuilder: (context, index) {
                final fav = favoris[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: fav['image'] != null && fav['image']!.isNotEmpty
                        ? Image.network(
                            fav['image']!,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image_not_supported),
                          )
                        : const Icon(Icons.favorite),
                    title: Text(fav['title'] ?? 'Produit sans nom'),
                    subtitle: Text('${fav['price'] ?? '0'} €'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}