
// ignore_for_file: use_build_context_synchronously

import 'package:empleo_app/domain/domain.dart';
import 'package:empleo_app/domain/entities/empresa.dart';
import 'package:empleo_app/presentation/providers/data/user_session_provider.dart';
import 'package:empleo_app/presentation/widgets/helpers/validar_cedula_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/providers/data/user_provider.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';

class CrudEmpresaScreen extends ConsumerStatefulWidget {
  const CrudEmpresaScreen({super.key});

  @override
  CrudEmpresaScreenState createState() => CrudEmpresaScreenState();
}

class CrudEmpresaScreenState extends ConsumerState<CrudEmpresaScreen> {
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
                child: const EmpresaFormView()
              )
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Lista de empresas'),),
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



class EmpresaFormView extends ConsumerStatefulWidget {
  final Empresa? empresa;
  const EmpresaFormView({
    super.key, this.empresa,
  });

  @override
  EmpresaFormViewState createState() => EmpresaFormViewState();
}

class EmpresaFormViewState extends ConsumerState<EmpresaFormView> {
  final _formKey = GlobalKey<FormState>();
  String nombre = '';
  String ruc = '';
  String owner = '';
  String descripcion = '';
  String logo = '';
  String eslogan = '';
  String email = '';
  String password = '';
  List<Provincia>? provincia = [];
  DateTime? fechaNaci;

  @override
  void initState() {
    super.initState();
    nombre = widget.empresa?.nombre ?? '';
    ruc = widget.empresa?.ruc ?? '';
    owner = widget.empresa?.owner ?? '';
    descripcion = widget.empresa?.descripcion ?? '';
    logo = widget.empresa?.logo ?? '';
    eslogan = widget.empresa?.eslogan ?? '';
    email = widget.empresa?.email ?? '';
    password = widget.empresa?.password ?? '';
    provincia = widget.empresa?.provincias ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Nuevo empresa', style: textStyle.titleLarge),
              const Divider(),
              const CircleAvatar(maxRadius: 50),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Nombre empresa',
                      defaultValue: nombre,
                      onChanged: (p0) {
                        nombre = p0;
                        _formKey.currentState?.validate();
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty) return 'Campo requerido';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'RUC',
                      defaultValue: ruc,
                      onChanged: (p0) {
                        ruc = p0;
                        _formKey.currentState?.validate();
                      },
                      validator: validarRucEcuatoriano,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Correo empresarial',
                      defaultValue: email,
                      onChanged: (p0) {
                        email = p0;
                        _formKey.currentState?.validate();
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
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Nombre del Dueño',
                      onChanged: (p0) {
                        owner = p0;
                        _formKey.currentState?.validate();
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty) return 'Campo requerido';
                        return null;
                      },
                      defaultValue: owner,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Descripcion de la empresa',
                      defaultValue: descripcion,
                      onChanged: (p0) {
                        descripcion = p0;
                        _formKey.currentState?.validate();
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty) return 'Campo requerido';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Eslogan',
                      onChanged: (p0) {
                        eslogan = p0;
                        _formKey.currentState?.validate();
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty) return 'Campo requerido';
                        return null;
                      },
                      defaultValue: eslogan,
                    ),
                  ),
                ],
              ),






              CalendarDatePicker(
                initialDate: fechaNaci ?? DateTime.now(),
                firstDate: DateTime(1950, 1, 1),
                lastDate: DateTime.now(),
                onDateChanged: (value) {
                  setState(() {
                    fechaNaci = value;
                  });
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancelar'),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {

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
