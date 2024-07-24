





import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SexoBox extends ConsumerStatefulWidget {
  final Function(dynamic) onSelected;
  const SexoBox({
    super.key,
    required this.onSelected
  });

  @override
  SexoBoxState createState() => SexoBoxState();
}

class SexoBoxState extends ConsumerState<SexoBox> {

  dynamic selected = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DropdownButton(
      dropdownColor: colors.onInverseSurface,
      borderRadius: BorderRadius.circular(10),
      padding: const EdgeInsets.all(10),
      icon: const Icon(Icons.arrow_drop_down),
      value: selected,
      items: const [
        DropdownMenuItem(
          value: 0,
          child: Text('Genero'),
        ),
        DropdownMenuItem(
          value: 'M',
          child: Text('Masculino'),
        ),
        DropdownMenuItem(
          value: 'F',
          child: Text('Femenino'),
        ),
        
      ],
      onChanged: (value) {
        if(value == null)return;
        setState(() {
          selected = value;
        });
        widget.onSelected(value);
      },
    );
  }
}