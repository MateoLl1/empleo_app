

import 'package:empleo_app/domain/domain.dart';

class ApiRepositoryImpl extends ApiRepository {

  final ApiDatasource datasource;

  ApiRepositoryImpl({required this.datasource});

  @override
  Future<List<Provincia>> getAllProvincias() {
    return datasource.getAllProvincias();
  }

  @override
  Future<List<TpUsuario>> getAllTpUsuarios() {
    return datasource.getAllTpUsuarios();
  }

  @override
  Future<Usuario?> loginUser(String emai, String password) {
    return datasource.loginUser(emai, password);
  }

  @override
  Future<Usuario?> saveUsuario(Usuario user) {
    return datasource.saveUsuario(user);
  }
  
  @override
  Future<List<Usuario>> getAllUsers() {
    return datasource.getAllUsers();
  }
  
  @override
  Future<bool> deleteUserById(int id) {
    return datasource.deleteUserById(id);
  }
  
  @override
  Future<bool> deleteProvinciaByID(int id) {
    return datasource.deleteProvinciaByID(id);
  }
  
  
  @override
  Future<Provincia?> saveProvincia(Provincia provincia) {
    return datasource.saveProvincia(provincia);
  }
  
}