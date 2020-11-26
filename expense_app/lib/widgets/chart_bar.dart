import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double spendPctofTotal;

  ChartBar(this.label, this.spendAmount, this.spendPctofTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('₹${spendAmount.toStringAsFixed(0)}'),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(),
        ),
        SizedBox(height: 4),
        Text(label)
      ],
    );
  }
}
