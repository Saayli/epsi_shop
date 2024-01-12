import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentItem extends StatefulWidget {
  const PaymentItem({super.key, required this.icon});

  final Widget icon;

  @override
  State<PaymentItem> createState() => _PaymentItemState();
}

class _PaymentItemState extends State<PaymentItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return _isSelected
        ? SizedBox(
            height: 80,
            width: 80,
            child: Badge(
              offset: const Offset(-7, 9),
              label: const FaIcon(FontAwesomeIcons.check),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                    child: IconButton(onPressed: _select, icon: widget.icon)),
              ),
            ),
          )
        : SizedBox(
            height: 80,
            width: 80,
            child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: IconButton(onPressed: _select, icon: widget.icon)),
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
