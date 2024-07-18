
// ignore_for_file: use_build_context_synchronously

import 'package:empleo_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';
import 'package:empleo_app/presentation/screens/painters/painters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (size.width>=993) ? Expanded(
                flex: 1,
                child: CustomPaint(
                  size: Size(size.width, size.height),
                  painter: LoginPainter(),
                ),
              ):const SizedBox(),
              const _FormView(),
            ],
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: IconButton(
              icon: const Icon(Icons.close,size: 50,),
              onPressed: () => context.go('/landing'),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormView extends ConsumerStatefulWidget {
  const _FormView();

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends ConsumerState<_FormView> {
  final formKey = GlobalKey<FormState>();
  final focusEmail = FocusNode();
  final focusPassword = FocusNode();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width >=800 ? size.width * .55 : size.width*.9,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .1),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Iniciar Session',
                style: textStyle.titleLarge?.copyWith(fontSize: 40),
              ),
              CustomTextFormField(
                focusNode: focusEmail,
                label: 'Correo electronico',
                hintText: 'ejemplo@gmail.com',
                icon: Icons.person,
                onChanged: (value) {
                  email = value.trim();
                  formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null) return 'Campo requerido';
                  if (value.trim().isEmpty) return 'Campo requerido';
                  final emailRegExp = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegExp.hasMatch(value.trim())) return 'Email invalido';

                  return null;
                },
              ),
              CustomTextFormField(
                focusNode: focusPassword,
                label: 'Contraseña',
                hintText: '********',
                icon: Icons.key,
                onChanged: (value) {
                  password = value.trim();
                  formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Campo requerido';
                  return null;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  child: const Text('Iniciar'),
                  onPressed: () async{
                    // final isValid = formKey.currentState?.validate();
                    // if(!isValid!) return;
                    // final apiRes = await ref.read(userSessionProvider.notifier).login(email, password);
                    final apiRes = await ref.read(userSessionProvider.notifier).login('mateollerena40@gmail.com', '123456');
                    if(apiRes == false) {
                      customSnackBarMessage(context, 'Credenciales incorrectas');
                      return;
                    }
                    customSnackBarMessage(context, 'Bienvenido');
                    context.go('/home');

                  },
                ),
              ),
              const SizedBox(height: 30),


              Wrap(
                alignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  InkWell(
                    onTap: () => context.go('/recuperar-password'),
                    child: const Text(
                      '¡Olvide mi contraseña!',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(width: 50,),
                  InkWell(
                    onTap: () => context.go('/register'),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Crear una cuenta'),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}