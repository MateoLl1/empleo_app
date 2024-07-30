import 'package:empleo_app/domain/domain.dart';

class OfertaMapper {
  static Oferta toEntity(Map<String, dynamic> json) => Oferta(
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
  );
}
