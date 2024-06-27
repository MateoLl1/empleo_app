import 'package:flutter/material.dart';

class FooterApp extends StatelessWidget {
  const FooterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            // ignore: deprecated_member_use
            color: colors.onBackground,
            width: 0.5,
          ),
        ),
      ),
      child: const Center(
        child: Text('Copyright 2014 - 2024 DGNET LTD.'),
      ),
    );
  }
}
