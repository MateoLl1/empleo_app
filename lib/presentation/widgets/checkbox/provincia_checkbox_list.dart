import 'package:empleo_app/domain/domain.dart';
import 'package:flutter/material.dart';

class ProvinciaCheckBoxList extends StatefulWidget {
  final List<Provincia> provincias;
  final Function(List<Provincia>) onSelectionChanged;

  const ProvinciaCheckBoxList({
    Key? key, 
    required this.provincias, 
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  ProvinciaCheckBoxListState createState() => ProvinciaCheckBoxListState();
}

class ProvinciaCheckBoxListState extends State<ProvinciaCheckBoxList> {
  final List<Provincia> _selectedProvincias = [];

  void _onProvinciaSelected(bool? selected, Provincia provincia) {
    setState(() {
      if (selected == true) {
        _selectedProvincias.add(provincia);
      } else {
        _selectedProvincias.remove(provincia);
      }
      widget.onSelectionChanged(_selectedProvincias); // Notifica al padre
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Center(child: Text('Sedes de la empresa')),
          Expanded(
            child: ListView(
              children: widget.provincias.map((provincia) {
                return CheckboxListTile(
                  title: Text(provincia.nombre ?? ''),
                  value: _selectedProvincias.contains(provincia),
                  onChanged: (bool? selected) {
                    _onProvinciaSelected(selected, provincia);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
