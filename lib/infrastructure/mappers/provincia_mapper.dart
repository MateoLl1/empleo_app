

import 'package:empleo_app/domain/domain.dart';

class ProvinciaMapper {
  
  static Provincia toEntity(Map<String,dynamic> json) => Provincia(
    id: json['id'], 
    nombre: json['nombre']
  );

}