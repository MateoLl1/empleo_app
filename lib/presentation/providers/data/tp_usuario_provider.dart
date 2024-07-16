



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/domain/domain.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

final tpUsuarioProvider = StateNotifierProvider<TpUsuarioNotifier,List<TpUsuario>>((ref) {
  final repository = ref.watch(apiRepositoryProvider);
  return TpUsuarioNotifier(repository: repository);
});

class TpUsuarioNotifier extends StateNotifier<List<TpUsuario>> {
  final ApiRepository repository;
  TpUsuarioNotifier({required this.repository}): super([]);
  
  Future<void> getTpUsuarios()async{
    final tpUsuarios = await repository.getAllTpUsuarios();
    state = [...tpUsuarios];
  }

}