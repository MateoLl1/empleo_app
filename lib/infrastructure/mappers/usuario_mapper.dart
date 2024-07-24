import 'package:empleo_app/domain/domain.dart';

class UsuarioMapper {
  static Usuario toEntity(Map<String, dynamic> json) => Usuario(
        id: json['id'],
        nombre: json['nombre'],
        email: json['email'],
        password: json['password'],
        cedula: json['cedula'],
        imagen: json['imagen'],
        feNacimiento: DateTime.tryParse(json['feNacimiento'] ?? ''),
        feRegistro: DateTime.tryParse(json['feRegistro'] ?? ''),
        sexo: json['sexo'],
        estado: json['estado'],
        provincia: Provincia(
          id: json['provincia']['id'],
          nombre: json['provincia']['nombre'],
        ),
        tpUsuario: TpUsuario(
          id: json['tpUsuario']['id'],
          nombre: json['tpUsuario']['descripcion'],
        ),
      );
}
