import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bo/cart.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finalisation de la commande"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const Column(
          children: [
            TotalItem(),
            Spacer(),
            AdressItem(),
            Spacer(),
            PaimentItem(),
            Spacer(),
            ValidationButton(),
          ],
        ),
      ),
    );
  }
}

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

class AdressItem extends StatelessWidget {
  const AdressItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Adresse de livraison", style: TextStyle(fontSize: 19)),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
            margin: const EdgeInsets.only(top: 10),
            child: Container(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 20),
              child: const Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Michel Le Poney",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("8 rue des ouvertures de portes"),
                    Text("93204 CORBEAUX")
                  ],
                ),
                Spacer(),
                FaIcon(FontAwesomeIcons.chevronRight)
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class PaimentItem extends StatefulWidget {
  const PaimentItem({super.key});

  @override
  State<PaimentItem> createState() => _PaimentItemState();
}

class _PaimentItemState extends State<PaimentItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Méthode de paiement", style: TextStyle(fontSize: 19)),
        Row(
          children: [
            SizedBox(
                height: 100,
                child: IconButton(
                  onPressed: _select,
                  icon: _isSelected
                      ? const FaIcon(FontAwesomeIcons.paypal)
                      : const Icon(Icons.star),
                )),
            Spacer(),
            SizedBox(
                height: 100,
                child: IconButton(
                  onPressed: _select,
                  icon: _isSelected
                      ? const FaIcon(FontAwesomeIcons.applePay)
                      : const Icon(Icons.star),
                )),
            Spacer(),
            SizedBox(
                height: 100,
                child: IconButton(
                  onPressed: _select,
                  icon: _isSelected
                      ? const FaIcon(FontAwesomeIcons.ccVisa)
                      : const Icon(Icons.star),
                )),
            Spacer(),
            SizedBox(
                height: 100,
                child: IconButton(
                  onPressed: _select,
                  icon: _isSelected
                      ? const FaIcon(FontAwesomeIcons.ccMastercard)
                      : const Icon(Icons.star),
                ))
          ],
        ),
      ],
    );
  }

  void _select() {
    setState(() {
      if (_isSelected) {
        _isSelected = false;
      } else {
        _isSelected = true;
      }
    });
  }
}

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
