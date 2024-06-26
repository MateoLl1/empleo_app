
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationDrawer(
      children: [

        NavigationDrawerDestination(
          icon: Icon(Icons.home), 
          label: Text('Inicio')
        )

      ],
    );
  }
}