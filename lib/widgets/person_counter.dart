import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required int personCount,
    required this.onDecrement,
    required this.onIncrement,
  }) : _personCount = personCount;

  final int _personCount;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Split',
            style: TextStyle(
              fontSize: 12,
            )),
        Row(
          children: [
            IconButton(
                color: Colors.deepPurple,
                onPressed: onDecrement,
                icon: Icon(Icons.remove)),
            Text('$_personCount', style: TextStyle(fontSize: 12)),
            IconButton(
                color: Colors.deepPurple,
                onPressed: onIncrement,
                icon: Icon(Icons.add))
          ],
        ),
      ],
    );
  }
}
