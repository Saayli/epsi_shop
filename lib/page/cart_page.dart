import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Demo Sales'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          //Si j'ai plus de 0  éléments dans le panier j'affiche la liste
          // des élépments dans le panier
          // sinon j'affiche le Widget EmptyCart qui affiche "Votre Panier est vide"
          child: context.watch<Cart>().articles.isNotEmpty
              ? const ListCart()
              : const EmptyCart(),
        ));
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Votre panier est de :", style: TextStyle(fontSize: 18)),
          Text(
            "PRIX",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.end,
          ),
        ]),
        Spacer(),
        Text("Votre panier est actuellement vide"),
        Icon(Icons.image),
        Spacer()
      ],
    );
  }
}

class ListCart extends StatelessWidget {
  const ListCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, cart, _) => Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Votre panier est de :",
                          style: TextStyle(fontSize: 18)),
                      Text(
                        "${context.read<Cart>().totalPrix().toStringAsFixed(2)}€",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                Flexible(
                  child: ListView.builder(
                      itemCount: cart.articles.length,
                      itemBuilder: (context, index) => ListTile(
                            title: Text(cart.articles[index].nom),
                            subtitle: Text(
                              cart.articles[index].getPrixEuro(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Image.network(cart.articles[index].image),
                            trailing: TextButton(
                              onPressed: () => context
                                  .read<Cart>()
                                  .removeArticle(cart.articles[index]),
                              child: const Text("Supprimer"),
                            ),
                          )),
                ),
                TextButton(
                    onPressed: () => context.go("/cart/buy"),
                    child: Text("Procéder au paiement"))
              ],
            ));
  }
}
