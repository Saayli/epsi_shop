import 'package:flutter/material.dart';
import 'package:epsi_shop/bo/article.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class DetailsPage extends StatelessWidget {
  final Article article;

  const DetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(style: TextStyle(color: Colors.white), article.nom),
        actions: [
          Badge(
              label: Text("${context.watch<Cart>().articles.length}"),
              offset: Offset(-6, 7),
              child: IconButton(
                  onPressed: () => context.go('/cart'),
                  icon: const Icon(Icons.shopping_cart)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Image.network(
            article.image,
            height: 200.0,
          ),
          Text(article.description ?? "Pas de desc"),
          Text(
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
              "${article.prix}€"),
          const Spacer(),
          const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white60,
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ],
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                      shadowColor: Colors.grey),
                  onPressed: () => context.read<Cart>().addArticle(article),
                  child: const Text('Ajouter'),
                ),
              ],
            ),
          ),
          context.read<Cart>().articleInCart(article)
              ? TextButton(
                  onPressed: () => context.read<Cart>().removeArticle(article),
                  child: const Text("Supprimer"),
                )
              : Container(),
        ]),
      ),
    );
  }
}
