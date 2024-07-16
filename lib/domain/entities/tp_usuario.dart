class TpUsuario {
  final int? id;
  final String? nombre;

  TpUsuario({required this.id, this.nombre});

  @override
  String toString() {
    return 'TpUsuario{id: $id, nombre: $nombre}';
  }

  TpUsuario copyWith({
    int? id,
    String? nombre,
  }) =>
      TpUsuario(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
      );
}
