
import 'package:empleo_app/presentation/providers/data/tp_usuario_provider.dart';
import 'package:empleo_app/presentation/widgets/cards/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CrudTpUsuarioScreen extends ConsumerStatefulWidget {
  const CrudTpUsuarioScreen({super.key});

  @override
  CrudTpUsuarioScreenState createState() => CrudTpUsuarioScreenState();
}

class CrudTpUsuarioScreenState extends ConsumerState<CrudTpUsuarioScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(tpUsuarioProvider.notifier).getTpUsuarios();
  }
  
  @override
  Widget build(BuildContext context) {
    final tpUsuarios = ref.watch(tpUsuarioProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Tipos de usuario'),),
      body: ListView.builder(
        itemCount: tpUsuarios.length,
        itemBuilder: (context, index) {
          final tp = tpUsuarios[index];
          return CustomCard(index: index+1,label: tp.nombre!,);
        },
      ),
    );
  }
}