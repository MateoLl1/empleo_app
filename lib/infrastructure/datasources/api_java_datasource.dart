

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
  Future<List<TpUsuario>> getAllTpUsuarios() {
    // TODO: implement getAllTpUsuarios
    throw UnimplementedError();
  }

  @override
  Future<Usuario?> loginUser(String emai, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Usuario?> saveUsuario(Usuario user) {
    // TODO: implement saveUsuario
    throw UnimplementedError();
  }
  
}