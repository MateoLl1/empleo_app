import 'package:empleo_app/domain/domain.dart';

class EmpresaMapper {
  static Empresa toEntity(Map<String, dynamic> json) => Empresa(
    id: json['em_id'], 
    nombre: json['name'],
    ruc: json['ruc'], 
    owner: json['owner'], 
    descripcion: json['descripcion'], 
    logo: json['logo'], 
    eslogan: json['eslogan'], 
    email: json['email'], 
    password: json['password'],
    provincias: (json['provincias'] as List<dynamic>?)
        ?.map((provinciaJson) => Provincia(
          id: provinciaJson['id'], 
          nombre: provinciaJson['nombre'],
        ))
        .toList(),
  );
}

