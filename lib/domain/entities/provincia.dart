

class Provincia {
  final int? id;
  final String nombre;

  Provincia({
    required this.id, 
    required this.nombre
  });

  Provincia copyWith({
    int? id,
    String? nombre
  }) => Provincia(
    id: id ?? this.id, 
    nombre: nombre ?? this.nombre
  );

  

}