import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.total,
  });

  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                'Total per Person',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(total.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          )),
    );
  }
}
