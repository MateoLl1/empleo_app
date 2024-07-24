
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/providers.dart';

class LoadingLoginScreen extends ConsumerStatefulWidget {
  const LoadingLoginScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends ConsumerState<LoadingLoginScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(userSessionProvider.notifier).getUserSession();
    validarCredenciales();
  }

  validarCredenciales(){
    final user = ref.read(userSessionProvider.notifier).getUserSession();
    if (user != null) {
      if (user.tpUsuario?.id == 5) {
        context.go('/administracion') ;
      }
      else if (user.tpUsuario?.id == 6) {
        context.go('/empresa') ;
      }
      else if (user.tpUsuario?.id == 7) {
        context.go('/home') ;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}