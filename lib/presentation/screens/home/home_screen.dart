import 'package:empleo_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final user = ref.watch(userSessionProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Home screen'),),
      body: user[0].id != null ? Column(
        children: [

            FlutterLogo(),
            Text(user[0].cedula)
            

        ],
      ):const CircularProgressIndicator(),
    );
  }
}