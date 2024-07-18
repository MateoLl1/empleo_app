import 'package:empleo_app/domain/domain.dart';

class Usuario {
  int? id;
  String nombre;
  String email;
  String password;
  String cedula;
  String? imagen;
  String? feNacimiento;
  DateTime? feRegistro;
  String? sexo;
  String? estado;
  TpUsuario? tpUsuario;
  Provincia? provincia;

  Usuario({
    this.id,
    required this.nombre,
    required this.email,
    required this.password,
    required this.cedula,
    this.imagen = 'https://www.nicepng.com/png/full/128-1280406_user-icon-png.png',
    this.feNacimiento = '',
    this.feRegistro,
    this.sexo = '?',
    this.estado = 'A',
    this.tpUsuario,
    this.provincia,
  });

  @override
  String toString() {
    return 'Usuario{id: $id, nombre: $nombre, email: $email, password: $password, '
        'cedula: $cedula, imagen: $imagen, feNacimiento: $feNacimiento, '
        'feRegistro: $feRegistro, sexo: $sexo, estado: $estado, '
        'tpUsuario: ${tpUsuario.toString()}, provincia: ${provincia.toString()}}';
  }

  Usuario copyWith({
    int? id,
    String? nombre,
    String? email,
    String? password,
    String? cedula,
    String? imagen,
    String? feNacimiento,
    DateTime? feRegistro,
    String? sexo,
    String? estado,
    TpUsuario? tpUsuario,
    Provincia? provincia,
  }) =>
      Usuario(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        email: email ?? this.email,
        password: password ?? this.password,
        cedula: cedula ?? this.cedula,
        imagen: imagen ?? this.imagen,
        feNacimiento: feNacimiento ?? this.feNacimiento,
        feRegistro: feRegistro ?? this.feRegistro,
        sexo: sexo ?? this.sexo,
        estado: estado ?? this.estado,
        tpUsuario: tpUsuario ?? this.tpUsuario,
        provincia: provincia ?? this.provincia,
      );
}
