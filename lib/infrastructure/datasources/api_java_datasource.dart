

import 'package:dio/dio.dart';
import 'package:empleo_app/domain/domain.dart';
import 'package:empleo_app/infrastructure/infrastructure.dart';

const apiBase = 'http://localhost:3030/api';
class ApiJavaDatasource extends ApiDatasource {

  final _dio = Dio(BaseOptions(baseUrl: apiBase));

  @override
  Future<List<Provincia>> getAllProvincias()async {
    try {
      final response = await _dio.get('/provincia');
      final List<dynamic> data = response.data;
      return data.map((e) => ProvinciaMapper.toEntity(e)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<TpUsuario>> getAllTpUsuarios()async {
    try {
      final response = await _dio.get('/tp-usuario');
      final List<dynamic> data = response.data;
      return data.map((e) => TpUsuarioMapper.toEntity(e)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Usuario?> loginUser(String emai, String password)async {
    try {
      final response = await _dio.get(
        '/usuario/login',queryParameters: {
          'email' : emai,
          'password' : password
        }
      );  
      final Map<String,dynamic> userData = response.data;
      return UsuarioMapper.toEntity(userData);
    } catch (e) {
      return null;
    }
  }

   @override
  Future<Usuario?> saveUsuario(Usuario user) async {
    try {
      final response = await _dio.post(
        '/usuario',
        data: {
          'id': user.id,
          'nombre': user.nombre,
          'email': user.email,
          'password': user.password,
          'cedula': user.cedula,
          'imagen': user.imagen,
          'feNacimiento': user.feNacimiento,
          'feRegistro': user.feRegistro?.toIso8601String(),
          'sexo': user.sexo,
          'estado': user.estado,
          'tpUsuario': {
              'id': user.tpUsuario!.id,
              'descripcion': user.tpUsuario!.nombre,
            },
          'provincia': {
              'id': user.provincia!.id,
              'nombre': user.provincia!.nombre,
            },
        },
      );

      final Map<String, dynamic> userData = response.data;
      return UsuarioMapper.toEntity(userData);
    } catch (e) {
      return null;
    }
  }
  
}