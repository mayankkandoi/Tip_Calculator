import 'package:flutter/material.dart';

class TipRow extends StatelessWidget {
  const TipRow({
    super.key,
    required this.totalT,
  });

  final double totalT;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tip',
            style: TextStyle(
              fontSize: 12,
            )),
        Text("${totalT.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 12,
            )),
      ],
    );
  }
}
