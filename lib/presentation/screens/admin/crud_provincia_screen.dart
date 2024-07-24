
import 'package:empleo_app/presentation/providers/providers.dart';
import 'package:empleo_app/presentation/widgets/cards/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CrudProvinciaScreen extends ConsumerStatefulWidget {
  const CrudProvinciaScreen({super.key});

  @override
  CrudProvinciaScreenState createState() => CrudProvinciaScreenState();
}

class CrudProvinciaScreenState extends ConsumerState<CrudProvinciaScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(provinciaProvider.notifier).getProvincia();
  }
  
  @override
  Widget build(BuildContext context) {
    final provincias = ref.watch(provinciaProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de provincias'),),
      body: ListView.builder(
        itemCount: provincias.length,
        itemBuilder: (context, index) {
          final provincia = provincias[index];
          return CustomCard(index: index+1,label: provincia.nombre!,);
        },
      ),
    );
  }
}