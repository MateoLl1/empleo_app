

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final String label;
  const CustomCard({super.key, required this.index, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      decoration: BoxDecoration(
        color: colors.inversePrimary,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Text('$index .'),
          const SizedBox(width: 5,),
          Text(label)
        ],
      ),
    );
  }
}