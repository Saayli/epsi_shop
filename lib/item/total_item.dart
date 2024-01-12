import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class TotalItem extends StatelessWidget {
  const TotalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, _) => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Récapitulatif de la commande",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  const Text("Sous-Total", style: TextStyle(fontSize: 15)),
                  const Spacer(),
                  Text(
                      "${context.read<Cart>().totalPrix().toStringAsFixed(2)}€")
                ],
              ),
              Row(
                children: [
                  const Text("TVA", style: TextStyle(fontSize: 15)),
                  const Spacer(),
                  Text("${context.read<Cart>().totalTva().toStringAsFixed(2)}€")
                ],
              ),
              Row(
                children: [
                  const Text("Total",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const Spacer(),
                  Text(
                    "${context.read<Cart>().totalPrixTva().toStringAsFixed(2)}€",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
