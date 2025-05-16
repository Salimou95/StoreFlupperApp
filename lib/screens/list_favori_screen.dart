import 'package:flutter/material.dart';

class ListFavoriScreen extends StatelessWidget {
  const ListFavoriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Affichage simple pour la liste des favoris (à personnaliser selon vos besoins)
    return Container(
      child: Text(
        'Aucun favori pour le moment.',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}