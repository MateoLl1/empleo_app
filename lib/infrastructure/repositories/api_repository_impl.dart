

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
  
  @override
  Future<bool> deleteEmpresaById(int id) {
    return datasource.deleteEmpresaById(id);
  }
  
  @override
  Future<Empresa?> saveEmpresa(Empresa empresa) {
    return datasource.saveEmpresa(empresa);
  }
  
  @override
  Future<List<Empresa>> getAllEmpresas() {
    return datasource.getAllEmpresas();
  }
  
  @override
  Future<bool> deleteOfertaById(int id) {
    return datasource.deleteOfertaById(id);
  }
  
  @override
  Future<List<Oferta>> getAllOfertas() {
    return datasource.getAllOfertas();
    
  }
  
  @override
  Future<List<Oferta>> getAllOfertasByEmpresaId(int id) {
    return datasource.getAllOfertasByEmpresaId(id);
  }
  
  @override
  Future<Oferta?> saveOferta(Oferta oferta) {
    return datasource.saveOferta(oferta);
  }
  
}