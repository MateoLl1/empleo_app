

import 'package:empleo_app/domain/domain.dart';

abstract class ApiDatasource {
  
  Future<List<Provincia>> getAllProvincias();

  Future<List<TpUsuario>> getAllTpUsuarios();

  Future<Usuario?> saveUsuario(Usuario user);
  
  Future<Usuario?> loginUser(String emai,String password);

}