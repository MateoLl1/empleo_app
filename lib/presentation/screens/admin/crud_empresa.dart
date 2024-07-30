// ignore_for_file: use_build_context_synchronously

import 'package:empleo_app/domain/domain.dart';
import 'package:empleo_app/presentation/providers/providers.dart';
import 'package:empleo_app/presentation/widgets/helpers/validar_cedula_helper.dart';
import 'package:empleo_app/presentation/widgets/table/empresa_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class CrudEmpresaScreen extends ConsumerStatefulWidget {
  const CrudEmpresaScreen({super.key});

  @override
  CrudEmpresaScreenState createState() => CrudEmpresaScreenState();
}

class CrudEmpresaScreenState extends ConsumerState<CrudEmpresaScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(empresaProvider.notifier).getEmpresas();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final empresas = ref.watch(empresaProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
                child: SizedBox(
                    width: size.width * .6, child: const EmpresaFormView())),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Lista de empresas'),
      ),
      body: ListView.builder(
        itemCount: empresas.length,
        itemBuilder: (BuildContext context, int index) {
          final emp = empresas[index];
          return EmpresaTable(
            empresa: emp,
            index: index + 1,
          );
        },
      ),
    );
  }
}

class EmpresaFormView extends ConsumerStatefulWidget {
  final Empresa? empresa;
  const EmpresaFormView({
    super.key,
    this.empresa,
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
  List<Provincia>? provincias = [];

  @override
  void initState() {
    super.initState();
    nombre = widget.empresa?.nombre ?? 'Optimsoft';
    ruc = widget.empresa?.ruc ?? '1234567897001';
    owner = widget.empresa?.owner ?? 'Marco Guayasamin';
    descripcion = widget.empresa?.descripcion ?? 'Una empresa de TI';
    eslogan = widget.empresa?.eslogan ?? 'Lo mejor es para ti';
    email = widget.empresa?.email ?? 'optimsoft@gmail.com';
    password = widget.empresa?.password ?? '';
    provincias = widget.empresa?.provincias ?? [];
    ref.read(provinciaProvider.notifier).getProvincia();
  }

  void _handleSelectionChanged(List<Provincia> selectedProvincias) {
    setState(() {
      provincias = selectedProvincias;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final provinciasProvider = ref.watch(provinciaProvider);
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
              ProvinciaCheckBoxList(
                provincias: provinciasProvider,
                onSelectionChanged: _handleSelectionChanged,
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
                      final isValid = _formKey.currentState?.validate();
                      if (!isValid!) return;
                      // if (provincias!.isEmpty) return;
                      final newEmpresa = Empresa(
                        id: widget.empresa?.id,
                        nombre: nombre,
                        ruc: ruc,
                        owner: owner,
                        descripcion: descripcion,
                        logo: logo,
                        eslogan: eslogan,
                        email: email,
                        password: ruc,
                        provincias: provincias
                      );
                      final apiRes = await ref.read(empresaProvider.notifier).save(newEmpresa);
                      if (!apiRes) {
                        customSnackBarMessage(context, 'Error de conexion');
                        return;
                      }else{
                        ref.read(empresaProvider.notifier).getEmpresas();
                        context.pop();
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
