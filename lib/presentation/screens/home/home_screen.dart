import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_network/image_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';
import 'package:empleo_app/presentation/providers/providers.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final isDark = ref.watch(darkModeProvider);
    final user = ref.watch(userSessionProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: size.width*.4,
          child: const CustomTextFormField(
            label: 'Buscar',
            icon: Icons.search,
          )
        ),
        leading: const Icon(Icons.work),
        actions: [
          
          const IconTextButton(icon: Icons.home,label: 'Inicio',),
          const IconTextButton(icon: Icons.analytics,label: 'Postulaciones',),
          const IconTextButton(icon: Icons.public,label: 'Empleos',),
          IconButton(
            onPressed: (){
              ref.read(darkModeProvider.notifier).state = !isDark;
            },
            icon: isDark 
              ? const Icon(Icons.dark_mode) 
              : const Icon(Icons.light_mode),
          ),

          InkWell(
            onTap: () => context.go('/profile'),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child:  CircleAvatar(
                child: ImageNetwork(
                  borderRadius: BorderRadius.circular(20),
                  image: user[0].imagen!, 
                  height: 40, 
                  width: 40
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ...user.map((e) => const Placeholder(),)
        ],
      ),
    );
  }
}