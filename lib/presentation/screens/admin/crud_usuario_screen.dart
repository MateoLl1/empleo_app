
// ignore_for_file: use_build_context_synchronously

import 'package:empleo_app/domain/domain.dart';
import 'package:empleo_app/presentation/providers/data/user_session_provider.dart';
import 'package:empleo_app/presentation/widgets/helpers/validar_cedula_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/data/user_provider.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';

class CrudUsuarioScreen extends ConsumerStatefulWidget {
  const CrudUsuarioScreen({super.key});

  @override
  CrudUsuarioScreenState createState() => CrudUsuarioScreenState();
}

class CrudUsuarioScreenState extends ConsumerState<CrudUsuarioScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(userProvider.notifier).getUsers();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final users = ref.watch(userProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (context) => Dialog(
              child: SizedBox(
                width: size.width*.6,
                child: const UserFormView()
              )
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Administracion de usuarios'),),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          return UserTable(user: user,index: index + 1,);
        },
      ),
    );
  }
}



class UserFormView extends ConsumerStatefulWidget {
  final Usuario? user;
  const UserFormView({
    super.key, this.user,
  });

  @override
  UserFormViewState createState() => UserFormViewState();
}

class UserFormViewState extends ConsumerState<UserFormView> {

  final _formKey = GlobalKey<FormState>();
  String nombre = '';
  String apellido = '';
  String email = '';
  String cedula = '';
  int tpUsuario = 0;
  int provincia = 0;
  dynamic genero = 0;
  DateTime? fechaNaci;

  @override
  void initState() {
    super.initState();
    nombre = widget.user?.nombre ?? '';
    apellido = widget.user?.nombre ?? '';
    email = widget.user?.email ?? '';
    cedula = widget.user?.cedula ?? '';
    tpUsuario = widget.user?.tpUsuario?.id ?? 0;
    provincia = widget.user?.provincia?.id ?? 0;
    genero = widget.user?.sexo ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              Text('Nuevo usuario',style: textStyle.titleLarge,),
              const Divider(),
              const CircleAvatar(maxRadius: 50,),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Nombre',
                      defaultValue: nombre,
                      onChanged: (p0) {
                        nombre = p0;
                      },
                    )
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Apellido',
                      defaultValue: apellido,
                      onChanged: (p0) {
                        apellido = p0;
                      },
                    )
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Correo electronico',
                      defaultValue: email,
                      onChanged: (p0) {
                        email = p0;
                      },
                    )
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Cedula',
                      onChanged: (p0) {
                        cedula = p0;
                      },
                      validator: validarCedulaEcuatoriana,
                      defaultValue: cedula,
                    )
                  ),
                ],
              ),
              
              Wrap(
                children: [
                  TipoUsuarioBox(
                    onSelected: (p0) {
                      tpUsuario = p0;
                    },
                  ),
                  ProvinciaBox(
                    onSelected: (p0) {
                      provincia = p0;
                    },
                  ),
                  SexoBox(
                    onSelected: (p0) {
                      genero = p0;
                    },
                  ),
              
                  Expanded(
                    child: CalendarDatePicker(
                      initialDate: fechaNaci,
                      firstDate: DateTime(1950, 1, 1), 
                      lastDate: DateTime.now(),
                      onDateChanged: (value) {
                        fechaNaci = value;
                      },
                    ),
                  ),
                ],
              ),
          
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: context.pop, 
                    child: const Text('Cancelar'),
                  ),
                  OutlinedButton(
                    onPressed: ()async{
                      if (
                        nombre== '' || apellido == '' || 
                        cedula=='' || email =='' || 
                        tpUsuario == 0 || provincia == 0 || 
                        fechaNaci == null || genero == 0
                      ) {
                        customSnackBarMessage(context, 'Llene todos los campos');
                      }else{
                        final user = Usuario(
                          nombre: '$nombre $apellido', 
                          email: email, 
                          password: cedula, 
                          cedula: cedula,
                          estado: 'A',
                          feNacimiento: fechaNaci,
                          feRegistro: DateTime.now(),
                          id: widget.user?.id ?? 0,
                          provincia: Provincia(id: provincia),
                          tpUsuario: TpUsuario(id: tpUsuario),
                          sexo: genero
                        );
                        final response = await ref.read(userSessionProvider.notifier).save(user);
                        if (!response) {
                          customSnackBarMessage(context, 'Error de conexion');
                          return;
                        }else{
                          ref.read(userProvider.notifier).getUsers();
                          context.pop();
                        }
                      }
                    }, 
                    child: const Text('Agregar'),
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