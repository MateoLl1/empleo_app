
class TpUsuario {
  
  final int? id;
  final String nombre;

  TpUsuario({required this.id, required this.nombre});
  
  TpUsuario copyWith({
    int? id,
    String? nombre
  })=>TpUsuario(
    id: id ?? this.id, 
    nombre: nombre ?? this.nombre
  );

}