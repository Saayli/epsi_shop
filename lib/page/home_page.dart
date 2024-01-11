import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:epsi_shop/bo/article.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

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

  Future<List<Article>> fetchListArticles() async {
    final response = await get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      final listMapArticles = jsonDecode(response.body) as List<dynamic>;
      final listArticles = <Article>[];
      for (Map<String, dynamic> map in listMapArticles) {
        listArticles.add(Article.fromMap(map));
      }
      return listArticles;
    } else {
      throw Exception("Erreur lors de la réception des articles");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-commerce'),
        actions: [
          Badge(
              label: Text("${context.watch<Cart>().articles.length}"),
              offset: Offset(-6, 7),
              child: IconButton(
                  onPressed: () => context.go('/cart'),
                  icon: const Icon(Icons.shopping_cart))),
          TextButton(
              onPressed: () => context.go('/about_us'),
              child: const Text("A propos de nous")),
        ],
      ),
      body: FutureBuilder<List<Article>>(
          future: fetchListArticles(),
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data![index].nom),
                      subtitle: Text(
                        snapshot.data![index].getPrixEuro(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: TextButton(
                        onPressed: () => context
                            .read<Cart>()
                            .addArticle(snapshot.data![index]),
                        child: const Text("Ajouter"),
                      ),
                      leading: Image.network(snapshot.data![index].image),
                      isThreeLine: true,
                      onTap: () =>
                          context.go('/details', extra: snapshot.data![index]),
                    );
                  },
                )
              : const Icon(Icons.error)),
    );
  }
}

//TextButton(
//                  onPressed: () =>
//                   context.read<Cart>().addArticle(lsArticle[index]),
//               child: const Text("Ajouter"),
