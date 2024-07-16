
import 'package:empleo_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends ConsumerState<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(provinciaProvider.notifier).getProvincia();
  }

  @override
  Widget build(BuildContext context) {
    final provincias = ref.watch(provinciaProvider);
    return Scaffold(
      body: provincias.isNotEmpty ? Expanded(
        child: ListView.builder(
          itemCount: provincias.length,
          itemBuilder: (BuildContext context, int index) {
            final provincia = provincias[index];
            return ListTile(title: Text(provincia.nombre!),);
          },
        ),
      ): const Center(child: CircularProgressIndicator(),)
    );
  }
}