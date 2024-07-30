import 'package:empleo_app/domain/domain.dart';

class Oferta {
  final int? id;
  final String titulo;
  final String subTitulo;
  final String descripcion;
  final String modalidad;
  final String ubicacion;
  final String area;
  final String tiempo;
  final int vacantes;
  final String experiencia;
  final double salario;
  final String fechaRegistro;
  final String estado;
  final Empresa? empresa;
  final List<Usuario>? usuarios;

  Oferta({
    this.id,
    required this.titulo,
    required this.subTitulo,
    required this.descripcion,
    required this.modalidad,
    required this.ubicacion,
    required this.area,
    required this.tiempo,
    required this.vacantes,
    required this.experiencia,
    required this.salario,
    required this.fechaRegistro,
    required this.estado,
    this.empresa,
    this.usuarios,
  });

  Oferta copyWith({
    int? id,
    String? titulo,
    String? subTitulo,
    String? descripcion,
    String? modalidad,
    String? ubicacion,
    String? area,
    String? tiempo,
    int? vacantes,
    String? experiencia,
    double? salario,
    String? fechaRegistro,
    String? estado,
    Empresa? empresa,
    List<Usuario>? usuarios,
  }) {
    return Oferta(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      subTitulo: subTitulo ?? this.subTitulo,
      descripcion: descripcion ?? this.descripcion,
      modalidad: modalidad ?? this.modalidad,
      ubicacion: ubicacion ?? this.ubicacion,
      area: area ?? this.area,
      tiempo: tiempo ?? this.tiempo,
      vacantes: vacantes ?? this.vacantes,
      experiencia: experiencia ?? this.experiencia,
      salario: salario ?? this.salario,
      fechaRegistro: fechaRegistro ?? this.fechaRegistro,
      estado: estado ?? this.estado,
      empresa: empresa ?? this.empresa,
      usuarios: usuarios ?? this.usuarios,
    );
  }

  @override
  String toString() {
    return 'Oferta{id: $id, titulo: $titulo, subTitulo: $subTitulo, descripcion: $descripcion, modalidad: $modalidad, ubicacion: $ubicacion, area: $area, tiempo: $tiempo, vacantes: $vacantes, experiencia: $experiencia, salario: $salario, fechaRegistro: $fechaRegistro, estado: $estado, empresa: $empresa, usuarios: $usuarios}';
  }
}
