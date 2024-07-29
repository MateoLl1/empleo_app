import 'package:empleo_app/domain/domain.dart';

class Empresa {
  final int? id;
  final String nombre;
  final String ruc;
  final String owner;
  final String descripcion;
  final String logo;
  final String eslogan;
  final String email;
  final String password;
  final List<Provincia>? provincias;

  Empresa({
    this.id,
    required this.nombre,
    required this.ruc,
    required this.owner,
    required this.descripcion,
    required this.logo,
    required this.eslogan,
    required this.email,
    required this.password,
    required this.provincias,
  });

  Empresa copyWith({
    int? id,
    String? nombre,
    String? ruc,
    String? owner,
    String? descripcion,
    String? logo,
    String? eslogan,
    String? email,
    String? password,
    List<Provincia>? provincias,
  }) {
    return Empresa(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      ruc: ruc ?? this.ruc,
      owner: owner ?? this.owner,
      descripcion: descripcion ?? this.descripcion,
      logo: logo ?? this.logo,
      eslogan: eslogan ?? this.eslogan,
      email: email ?? this.email,
      password: password ?? this.password,
      provincias: provincias ?? this.provincias,
    );
  }
}