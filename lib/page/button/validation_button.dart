import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bo/cart.dart';

class ValidationButton extends StatelessWidget {
  const ValidationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, cart, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                    "En cliquant sur 'Confirmer l'achat', vous acceptez les Conditions de vente de EPSI Shop International. "
                    "Besoin d'aide ? Désolé on peut rien faire.",
                    style: TextStyle(fontSize: 10)),
                const Text(
                    "En poursuivant, vous acceptez les Conditions d'utilisation du fournisseur de paiement CoffeeDis.",
                    style: TextStyle(fontSize: 10)),
                FilledButton(
                    onPressed: () => context.read<Cart>().removeAll(),
                    child: const Text("Confirmer l'achat"))
              ],
            ));
  }
}
