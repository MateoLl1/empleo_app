
import 'package:flutter/material.dart';

class AreaTrabajoCheckBox extends StatefulWidget {
  final String areaInicial;
  final Function(String) onAreaChanged;

  const AreaTrabajoCheckBox({
    super.key, 
    required this.areaInicial, 
    required this.onAreaChanged
  });

  @override
  AreaTrabajoCheckBoxState createState() => AreaTrabajoCheckBoxState();
}

class AreaTrabajoCheckBoxState extends State<AreaTrabajoCheckBox> {
  String? area;

  @override
  void initState() {
    super.initState();
    area = widget.areaInicial;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Área de Trabajo',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        RadioListTile<String>(
          title: const Text('Sistemas'),
          value: 'Sistemas',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Desarrollo'),
          value: 'Desarrollo',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Talento Humano'),
          value: 'Talento Humano',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Marketing'),
          value: 'Marketing',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),

        RadioListTile<String>(
          title: const Text('Diseño grafico'),
          value: 'Diseño grafico',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Ventas'),
          value: 'Ventas',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Finanzas'),
          value: 'Finanzas',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Produccion'),
          value: 'Produccion',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Servicio al Cliente'),
          value: 'Servicio al Cliente',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Administracion'),
          value: 'Administracion',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Recursos humanos'),
          value: 'Recursos humanos',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Tecnologias de la informacion'),
          value: 'Tecnologias de la informacion',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Ingenieria'),
          value: 'Ingenieria',
          groupValue: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
            widget.onAreaChanged(value!);
          },
        ),
      ],
    );
  }
}
