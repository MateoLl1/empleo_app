
import 'package:flutter/material.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('JobMatch',style: textStyle.titleLarge,),
        actions: [
          IconButton.filledTonal(
            onPressed: (){}, icon: const Icon(Icons.person)
          ),
          const SizedBox(width: 10,)
        ],
      ),
      body: const Placeholder(),
      drawer: const MenuLateral(),
    );
  }
}