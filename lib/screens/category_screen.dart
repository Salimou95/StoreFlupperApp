import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart'; // Ajoute cet import
import 'package:store/models/category.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/category_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/services/category_api_service.dart';

import 'product_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // récupérer la catégorie stockée dans le provider
    Category category = context.watch<CategoryProvider>().category!;
    // inspect(context.watch<CategoryProvider>().category);

    return Container(
      //   color: Colors.amber,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            category.name!,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          // affichage des produits
          FutureBuilder(
            future: CategoryApiService().getProductsByCategoryId(category.id!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> data = snapshot.requireData;
                // inspect(data);

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(data[index].images![0]),
                      title: Text(data[index].title!),
                      subtitle: Text('${data[index].price!}€'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 10),
                      // ! Chemin de navigation vers la page de détail : Salimou (1er version)
                      onTap: () {
                        // Définir l'ID du produit dans le provider avant la navigation
                        context.read<ProductProvider>().setProductId(data[index].id!);
                        // Naviguer vers la page détail
                        context.pushNamed('product-detail');
                      },
                    );
                  },
                );
              }

              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
