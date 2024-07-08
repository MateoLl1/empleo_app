import 'package:flutter/material.dart';

class FooterApp extends StatelessWidget {
  const FooterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      color: colors.onInverseSurface,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.facebook, color: colors.primary),
                onPressed: () {
                  // Acción al presionar el icono de Facebook
                },
              ),
              IconButton(
                icon: Icon(Icons.email, color: colors.primary),
                onPressed: () {
                  // Acción al presionar el icono de Twitter
                },
              ),
              IconButton(
                icon: Icon(Icons.apple, color: colors.primary),
                onPressed: () {
                  // Acción al presionar el icono de LinkedIn
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text('Copyright 2014 - 2024 DGNET LTD.'),
          ),
        ],
      ),
    );
  }
}
