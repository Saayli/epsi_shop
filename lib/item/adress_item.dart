import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
