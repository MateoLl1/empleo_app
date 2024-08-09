import 'package:empleo_app/domain/domain.dart';

class OfertaMapper {
  static Oferta toEntity(Map<String, dynamic> json) => Oferta(
    id: json['id'],
    titulo: json['titulo'],
    subTitulo: json['subTitulo'],
    descripcion: json['descripcion'],
    modalidad: json['modalidad'],
    ubicacion: json['ubicacion'],
    area: json['area'],
    tiempo: json['tiempo'],
    vacantes: json['vacantes'],
    experiencia: json['experiencia'],
    salario: json['salario'],
    fechaRegistro: json['fechaRegistro'],
    estado: json['estado'],
    empresa: Empresa(
      id: json['empresa']['em_id'],
      nombre: json['empresa']['name'],
      ruc: json['empresa']['ruc'],
      owner: json['empresa']['owner'],
      descripcion: json['empresa']['descripcion'],
      logo: (json['empresa']['logo'] == '') 
        ? 'https://th.bing.com/th/id/OIP.h0QSxOHYz-4guFPoCt9-YgHaHv?rs=1&pid=ImgDetMain' 
        : json['empresa']['logo'],
      eslogan: json['empresa']['eslogan'],
      email: json['empresa']['email'],
      password: json['empresa']['password'],
      provincias: (json['empresa']['provincias'] as List<dynamic>?)
        ?.map((item) => Provincia(
              id: item['id'],
              nombre: item['name'],
            ))
        .toList(),
    ),
  );
}
