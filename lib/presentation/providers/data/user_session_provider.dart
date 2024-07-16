



import 'package:empleo_app/domain/domain.dart';
import 'package:empleo_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSessionProvider = StateNotifierProvider<UserNotifier,List<Usuario>>((ref) {
  final repository = ref.watch(apiRepositoryProvider);
  return UserNotifier(repository: repository);
});


class UserNotifier extends StateNotifier<List<Usuario>> {
  final ApiRepository repository;
  UserNotifier({required this.repository}): super([]);


  Future<bool> login(String email,String password)async{
    final response = await repository.loginUser(email, password);
    if (response!.id != null) {
      state = [response];
      return true;
    }
    return false;
  }

  Future<bool> save(Usuario user)async{
    final response = await repository.saveUsuario(user);
    if (response!.id != null) {
      state = [response];
      return true;
    }
    return false;
  }

  
  
}