



import 'package:empleo_app/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

final empresaProvider = StateNotifierProvider<EmpresaNotifier,List<Empresa>>((ref) {
  final repository = ref.watch(apiRepositoryProvider);
  return EmpresaNotifier(repository: repository);
});


class EmpresaNotifier extends StateNotifier<List<Empresa>> {
  final ApiRepository repository;
  EmpresaNotifier({required this.repository}): super([]);

  Future<void> getEmpresas()async{
    final empresas = await repository.getAllEmpresas();
    if (empresas.isNotEmpty) {
      state = [...empresas];
    }
  }


  Future<bool> save(Empresa emp)async{
    final response = await repository.saveEmpresa(emp);
    if (response != null && response.id != null) {
      state = [response];
      return true;
    }
    return false;
  }

  Future<bool> deleteEmpresaById(int id)async{
    final response = await repository.deleteEmpresaById(id);
    getEmpresas();
    return response;
  }

  

  
  
}