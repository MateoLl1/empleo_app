
import 'package:empleo_app/presentation/widgets/helpers/validar_cedula_helper.dart';
import 'package:flutter/material.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';
import 'package:empleo_app/presentation/screens/painters/painters.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              onPressed: () => context.go('/login'),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormView extends StatefulWidget {
  const _FormView();

  @override
  State<_FormView> createState() => _FormViewState();
}

class _FormViewState extends State<_FormView> {
  final formKey = GlobalKey<FormState>();
  // final focusEmail = FocusNode();
  // final focusCedula = FocusNode();
  // final focusPassword = FocusNode();
  String email = '';
  String password = '';
  String confirmar = '';
  String cedula = '';
  String nombre = '';
  String apellido = '';

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
                'Registro',
                style: textStyle.titleLarge?.copyWith(fontSize: 40),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Nombre',
                      validator: (value) {
                        if (value!.trim().isEmpty) return 'Campo requerido'; 
                        return null;
                      },
                      onChanged: (value) {
                        nombre = value;
                        formKey.currentState?.validate();
                      },
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Apellido',
                      validator: (value) {
                        if (value!.trim().isEmpty) return 'Campo requerido'; 
                        return null;
                      },
                      onChanged: (value) {
                        apellido = value;
                        formKey.currentState?.validate();
                      },
                    ),
                  ),
                  
                ],
              ),

              CustomTextFormField(
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
                label: 'Cedula o ruc',
                hintText: '',
                keyboardType: TextInputType.number,
                icon: Icons.document_scanner,
                onChanged: (value) {
                  cedula = value.trim();
                  formKey.currentState?.validate();
                },
                validator: validarCedulaEcuatoriana,
              ),
              CustomTextFormField(
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
              CustomTextFormField(
                label: 'Confirmar contraseña',
                hintText: '********',
                icon: Icons.key,
                onChanged: (value) {
                  confirmar = value.trim();
                  formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Campo requerido';
                  if(confirmar != password) return 'Contraseñas no coinciden';
                  return null;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  child: const Text('Registarme'),
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();
                    if(!isValid!) return;
                    
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}