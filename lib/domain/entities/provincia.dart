class Provincia {
  final int? id;
  final String? nombre;

  Provincia({
    required this.id, 
    this.nombre,
  });

  @override
  String toString() {
    return 'Provincia{id: $id, nombre: $nombre}';
  }

  Provincia copyWith({
    int? id,
    String? nombre,
  }) => Provincia(
    id: id ?? this.id, 
    nombre: nombre ?? this.nombre,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
