



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

class TipoUsuarioBox extends ConsumerStatefulWidget {
  final Function(int) onSelected;
  const TipoUsuarioBox({
    super.key,
    required this.onSelected
  });

  @override
  TipoUsuarioBoxState createState() => TipoUsuarioBoxState();
}

class TipoUsuarioBoxState extends ConsumerState<TipoUsuarioBox> {

  int selected = 0;

  @override
  void initState() {
    super.initState();
    ref.read(tpUsuarioProvider.notifier).getTpUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    final tpUsuarios = ref.watch(tpUsuarioProvider);
    final colors = Theme.of(context).colorScheme;
    return  tpUsuarios.isNotEmpty 
    ? DropdownButton(
      dropdownColor: colors.inversePrimary,
      borderRadius: BorderRadius.circular(10),
      padding: const EdgeInsets.all(10),
      icon: const Icon(Icons.arrow_drop_down),
      value: selected,
      items: [
        const DropdownMenuItem(
          value: 0,
          child: Text('Tipo de usuario'),
        ),
        ...tpUsuarios.map(
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