





import 'package:empleo_app/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

final ofertaEmpresaProvider = StateNotifierProvider<OfertaEmpresaNotifier,List<Oferta>>((ref) {
  final repository = ref.watch(apiRepositoryProvider);
  return OfertaEmpresaNotifier(repository: repository);
});


class OfertaEmpresaNotifier extends StateNotifier<List<Oferta>> {
  final ApiRepository repository;
  OfertaEmpresaNotifier({required this.repository}): super([]);

  Future<void> getOfertasByEmpresa(int id)async{
    final empresas = await repository.getAllOfertasByEmpresaId(id);
    if (empresas.isNotEmpty) {
      state = [...empresas];
    }
  }


  Future<bool> save(Oferta oferta)async{
    final response = await repository.saveOferta(oferta);
    if (response != null && response.id != null) {
      state = [response];
      return true;
    }
    return false;
  }

  Future<bool> deleteOfertaById(int idEmpresa,int idOferta)async{
    final response = await repository.deleteOfertaById(idOferta);
    getOfertasByEmpresa(idEmpresa);
    return response;
  }

  

  
  
}