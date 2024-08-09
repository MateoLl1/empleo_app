

import 'package:flutter/material.dart';

class ModalidadCheckBox extends StatefulWidget {
  final String modalidadInicial;
  final Function(String) onModalidadChanged;

  const ModalidadCheckBox({
    super.key, 
    required this.modalidadInicial, 
    required this.onModalidadChanged
  });

  @override
  ModalidadCheckBoxState createState() => ModalidadCheckBoxState();
}

class ModalidadCheckBoxState extends State<ModalidadCheckBox> {
  String? modalidad;

  @override
  void initState() {
    super.initState();
    modalidad = widget.modalidadInicial;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Modalidad',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        RadioListTile<String>(
          title: const Text('Presencial'),
          value: 'Presencial',
          groupValue: modalidad,
          onChanged: (value) {
            setState(() {
              modalidad = value;
            });
            widget.onModalidadChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Remoto'),
          value: 'Remoto',
          groupValue: modalidad,
          onChanged: (value) {
            setState(() {
              modalidad = value;
            });
            widget.onModalidadChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Híbrido'),
          value: 'Híbrido',
          groupValue: modalidad,
          onChanged: (value) {
            setState(() {
              modalidad = value;
            });
            widget.onModalidadChanged(value!);
          },
        ),
      ],
    );
  }
}
