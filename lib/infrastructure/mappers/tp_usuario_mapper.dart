


import 'package:empleo_app/domain/domain.dart';

class TpUsuarioMapper {
  
  static TpUsuario toEntity(Map<String,dynamic> json) => TpUsuario(
    id: json['id'], 
    nombre: json['descripcion'],
  );
}