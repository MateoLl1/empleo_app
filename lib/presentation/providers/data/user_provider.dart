

import 'package:empleo_app/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

final userProvider = StateNotifierProvider<UserNotifier,List<Usuario>>((ref) {
  final repository = ref.watch(apiRepositoryProvider);
  return UserNotifier(repository: repository);
});


class UserNotifier extends StateNotifier<List<Usuario>> {
  final ApiRepository repository;
  UserNotifier({required this.repository}): super([]);

  Future<void> getUsers()async{
    final users = await repository.getAllUsers();
    if (users.isNotEmpty) {
      state = [...users];
    }
  }


  Future<bool> save(Usuario user)async{
    final response = await repository.saveUsuario(user);
    if (response != null && response.id != null) {
      state = [response];
      return true;
    }
    return false;
  }

  Future<bool> deleteUserById(int id)async{
    final response = await repository.deleteUserById(id);
    getUsers();
    return response;
  }

  

  
  
}