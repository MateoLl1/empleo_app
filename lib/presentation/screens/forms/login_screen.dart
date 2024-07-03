
import 'package:empleo_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Placeholder()
          ),
          _FormView()

        ],
      ),
    );
  }
}

class _FormView extends StatelessWidget {
  const _FormView();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
          Text('Iniciar Session',style: textStyle.titleLarge,),
      
          CustomTextFormField(
            label: 'Correo electronico',
            hintText: 'Correo electronico',
            icon: Icons.person,

          ),
      
      
        ],
      ),
    );
  }
}