import 'package:flutter/material.dart';
import 'package:epsi_shop/bo/article.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bo/cart.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Article> lsArticle = [
    Article(
        nom: "Tomate",
        categorie: "Légumes",
        prix: 1.99,
        image:
            "https://mapetiteassiette.com/wp-content/uploads/2021/08/800x600-tomate-min.png"),
    Article(
        nom: "Banane",
        categorie: "Fruit",
        prix: 2,
        image:
            "https://kadalys.com/cdn/shop/articles/shutterstock_99478112_loin.jpg?v=1696846693&width=2048")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-commerce'),
        actions: [IconButton(onPressed: () => context.go('/cart'), icon: const Icon(Icons.shopping_cart))],
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: lsArticle.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Column(
              children: [
                Text(lsArticle[index].nom),
                Text(
                  lsArticle[index].getPrixEuro(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            trailing: TextButton(
              onPressed: ()=>context.read<Cart>().add(lsArticle[index]),
              child: const Text("Ajouter"),
            ),
            leading: Image.network(lsArticle[index].image),
          );
        },
      ),
    );
  }
}
