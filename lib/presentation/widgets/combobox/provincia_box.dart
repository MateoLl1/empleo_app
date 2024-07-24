
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

class ProvinciaBox extends ConsumerStatefulWidget {
  final Function(int) onSelected;
  const ProvinciaBox({
    super.key,
    required this.onSelected
  });

  @override
  ProvinciaBoxState createState() => ProvinciaBoxState();
}

class ProvinciaBoxState extends ConsumerState<ProvinciaBox> {

  int selected = 0;

  @override
  void initState() {
    super.initState();
    ref.read(provinciaProvider.notifier).getProvincia();
  }

  @override
  Widget build(BuildContext context) {
    final provincias = ref.watch(provinciaProvider);
    final colors = Theme.of(context).colorScheme;
    return  provincias.isNotEmpty 
    ? DropdownButton(
      dropdownColor: colors.inversePrimary,
      borderRadius: BorderRadius.circular(10),
      padding: const EdgeInsets.all(10),
      icon: const Icon(Icons.arrow_drop_down),
      value: 0,
      items: [
        const DropdownMenuItem(
          value: 0,
          child: Text('Provincias'),
        ),
        ...provincias.map(
          (e) => DropdownMenuItem(
            value: e.id,
            child: Text(e.nombre!),
          ),
        )
      ],
      onChanged: (value) {
        if(value == null)return;
        setState(() {
          selected = value;
        });
        widget.onSelected(value);
      },
    ): const Text('Cargando...');
  }
}