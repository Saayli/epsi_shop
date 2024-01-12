import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bo/cart.dart';
import '../item/adress_item.dart';
import '../item/payment_item.dart';
import '../item/total_item.dart';
import 'button/validation_button.dart';

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
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Méthode de paiement", style: TextStyle(fontSize: 19)),
              Row(children: [
                PaymentItem(icon: FaIcon(FontAwesomeIcons.paypal)),
                Spacer(),
                PaymentItem(icon: FaIcon(FontAwesomeIcons.ccMastercard)),
                Spacer(),
                PaymentItem(icon: FaIcon(FontAwesomeIcons.ccVisa)),
                Spacer(),
                PaymentItem(icon: FaIcon(FontAwesomeIcons.applePay)),
              ])
            ]),
            Spacer(),
            ValidationButton(),
          ],
        ),
      ),
    );
  }
}
