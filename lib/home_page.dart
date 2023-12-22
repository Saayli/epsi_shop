import 'package:flutter/material.dart';
import 'package:epsi_shop/bo/article.dart';

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
              onPressed: () {},
              child: const Text("Ajouter"),
            ),
            leading: Image.network(lsArticle[index].image),
          );
        },
      ),
    );
  }
}
