import 'package:flutter/material.dart';

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
        body: const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: EmptyCart(),
        ));
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Votre panier est de :",
                style: TextStyle(fontSize: 18)),
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
