



import 'package:empleo_app/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

final ofertasEmpleoProvider = StateNotifierProvider<OfertaNotifier,List<Oferta>>((ref) {
  final repository = ref.watch(apiRepositoryProvider);
  return OfertaNotifier(repository: repository);
});


class OfertaNotifier extends StateNotifier<List<Oferta>> {
  final ApiRepository repository;
  OfertaNotifier({required this.repository}): super([]);

  Future<void> getAllOfertas()async{
    state.clear();
    final empresas = await repository.getAllOfertas();
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
    return response;
  }

  

  
  
}