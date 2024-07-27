

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/domain/domain.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

final provinciaProvider = StateNotifierProvider<ProvinciaNotifier,List<Provincia>>((ref) {
  final repository = ref.watch(apiRepositoryProvider);
  return ProvinciaNotifier(repository: repository);
});

class ProvinciaNotifier extends StateNotifier<List<Provincia>> {
  final ApiRepository repository;
  ProvinciaNotifier({required this.repository}): super([]);
  
  Future<void> getProvincia()async{
    final provincias = await repository.getAllProvincias();
    state = [...provincias];
  }

  Future<bool> deleteProvicinciaById(int id)async{
    final response = await repository.deleteProvinciaByID(id);
    getProvincia();
    return response;
  }

  Future<Provincia?> save(Provincia provincia)async{
    final response = await repository.saveProvincia(provincia);
    if (response != null) {
      state = [...state,response];
      return provincia;
    }
    return null;
  }

}