

import 'package:flutter/material.dart';

class TextButtonDivider extends StatelessWidget {
  const TextButtonDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TextButton(
          onPressed: () {
          
          }, 
          child: const Text('Hola')
        ),
        const Divider()

      ],
    );
  }
}