import 'package:flutter/material.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';


class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administracion del sistema'),
        actions: const [
          DarkModeButton()
        ],
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              shrinkWrap: true,
              childAspectRatio: 3,
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: const [
                IconCard(
                  icon: Icons.person,
                  label: 'Administracion de usuarios',
                ),
                IconCard(
                  icon: Icons.apartment,
                  label: 'Empresas',
                ),
                IconCard(
                  icon: Icons.supervisor_account,
                  label: 'Tipos de usuario',
                ),
                IconCard(
                  icon: Icons.flag,
                  label: 'Provincias',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
