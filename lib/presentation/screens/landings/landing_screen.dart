

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';
import 'package:empleo_app/presentation/providers/providers.dart';


class LandingPageScreen extends ConsumerWidget {
  const LandingPageScreen ({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final isDark = ref.watch(darkModeProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(darkModeProvider.notifier).state = !isDark;
        },
        child: const Icon(Icons.light_mode),
      ),
      appBar: AppBar(
        leading: const Icon(Icons.work),
        title: const Text('JobMatch'),
        actions: [

          TextButton(
            child: const Text('Reclutadores !Publica ofertas gratis!'),
            onPressed: (){}, 
          ),
          OutlinedButton(
            child: const Text('Crear CV'),
            onPressed: (){}, 
          ),
          
          const SizedBox(width: 10,)

        ],
      ),

      body: const _HomeView(),

    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
      
          _Bienvenida(),
          _About(),
          FooterApp()

        ],
      ),
    );
  }
}


class _Bienvenida extends StatelessWidget {
  const _Bienvenida();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      
          Column(
            children: [
              Text('Bienvenido a nuestra app',style: textStyle.titleLarge,),
              Container(
                width: size.width*.4,
                height: 1,
                color: colors.primary,
              ),
              SizedBox(
                width: size.width*.4,
                child:  Text(
                  'Nostrud sit exercitation voluptate consequat eu ipsum pariatur culpa reprehenderit aute incididunt voluptate proident pariatur. Aliquip ullamco in ea sint minim ea aliquip enim reprehenderit dolor do. Mollit occaecat anim non consequat irure eiusmod culpa ullamco occaecat et ullamco. Velit in id nulla occaecat elit tempor aliqua esse proident cillum sunt consectetur nisi irure. Ipsum et fugiat dolore velit dolore do ex magna ut cupidatat pariatur amet Lorem. Exercitation enim incididunt nisi do non occaecat et.',
                  style: textStyle.bodyLarge,
                )
              ),
                
            ],
          ),
          
          const FlutterLogo(size: 400,)
      
        ],
      ),
    );
  }
}

class _About extends StatelessWidget {
  const _About();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
      
          Text(
            'Si buscas trabajo ¡Computrabajo es tu mejor aliado!',
            style: textStyle.titleLarge,
          ),
          Text(
            'Miles de ofertas de empleo están esperándote',
            style: textStyle.bodyLarge,
          ),
          const SizedBox(height: 30,),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
      
              const FlutterLogo(size: 500,),
              const SizedBox(width: 20,),
              SizedBox(
                width: size.width*.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        
                      Text(
                        'Te ayudamos a encontrar un empleo mejor',
                        style: textStyle.titleLarge,
                        textAlign: TextAlign.start,
                      ), 
                      const Text('Haz que tu currículum sea visible para miles de empresas en nuestra bolsa de trabajo'), 
                      const ListTile(
                        leading: Icon(Icons.verified),
                        title: Text('Registro gratuito. Encuentra tu próximo trabajo hoy.'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.verified),
                        title: Text('Registro gratuito. Encuentra tu próximo trabajo hoy.'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.verified),
                        title: Text('Registro gratuito. Encuentra tu próximo trabajo hoy.'),
                      ),
                    ],
                  ),
                ),
              )
      
            ],
          )
      
      
        ],
      ),
    );
  }
}

