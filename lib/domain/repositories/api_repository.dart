
import 'package:empleo_app/domain/domain.dart';

abstract class ApiRepository {

  Future<List<Provincia>> getAllProvincias();

  Future<List<TpUsuario>> getAllTpUsuarios();

  Future<Usuario?> saveUsuario(Usuario user);
  
  Future<Usuario?> loginUser(String emai,String password);

  Future<List<Usuario>> getAllUsers();

  Future<bool> deleteUserById(int id);

  Future<Provincia?> saveProvincia(Provincia provincia);

  Future<bool> deleteProvinciaByID(int id);

  Future<Empresa?> saveEmpresa(Empresa empresa);

  Future<bool> deleteEmpresaById(int id);

  Future<List<Empresa>> getAllEmpresas();

  Future<List<Oferta>> getAllOfertas();

  Future<List<Oferta>> getAllOfertasByEmpresaId(int id);

  Future<Oferta?> saveOferta(Oferta oferta);

  Future<bool> deleteOfertaById(int id);


}