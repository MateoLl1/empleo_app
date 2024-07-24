
import 'package:flutter/material.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';

class CrudUsuarioScreen extends StatelessWidget {
  const CrudUsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Administracion de usuarios'),),
    body: const Row(
      children: [

        Expanded(child: UserFormView()),
        Placeholder()


      ],
    ),
    );
  }
}

class UserFormView extends StatelessWidget {
  const UserFormView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      children: [

        Text('Nuevo usuario',style: textStyle.titleLarge,),
        const Divider(),
        const CircleAvatar(maxRadius: 50,),
        const CustomTextFormField(label: 'Nombre'),
        const CustomTextFormField(label: 'Apellido'),
        const CustomTextFormField(label: 'Email'),
        const CustomTextFormField(label: 'Cedula'),
        const ProvinciaBox()
        


      ],
    );
  }
}