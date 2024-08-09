

// ignore_for_file: use_build_context_synchronously

import 'package:empleo_app/domain/domain.dart';
import 'package:empleo_app/presentation/providers/data/oferta_empresa_provider.dart';
import 'package:empleo_app/presentation/providers/data/provincia_provider.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CrudOfertasByEmpresa extends ConsumerStatefulWidget {
  final int idEmpresa;
  const CrudOfertasByEmpresa({super.key, required this.idEmpresa});

  @override
  CrudOfertasByEmpresaState createState() => CrudOfertasByEmpresaState();
}

class CrudOfertasByEmpresaState extends ConsumerState<CrudOfertasByEmpresa> {
  @override
  void initState() {
    super.initState();
    ref.read(ofertaEmpresaProvider.notifier).getOfertasByEmpresa(widget.idEmpresa);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ofertas = ref.watch(ofertaEmpresaProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Empresa id: ${widget.idEmpresa}'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              child: SizedBox(
                width: size.width * .6, 
                child: OfertaFormView(
                    idEmpresa: widget.idEmpresa,
                  )
                )
              ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ofertas.isNotEmpty ? ListView.builder(
        itemCount: ofertas.length,
        itemBuilder: (BuildContext context, int index) {
          final oferta = ofertas[index];
          return OfertaCard(oferta: oferta,);
        },
      ) : const Center(child: Text('Sin ofertas creadas'),),
    );
  }
}



class OfertaFormView extends ConsumerStatefulWidget {
  final Oferta? oferta;
  final int idEmpresa;
  const OfertaFormView({
    super.key,
    this.oferta,
    required this.idEmpresa
  });

  @override
  OfertaFormViewState createState() => OfertaFormViewState();
}

class OfertaFormViewState extends ConsumerState<OfertaFormView> {
  final _formKey = GlobalKey<FormState>();
  String titulo = '';
  String subtitulo = '';
  String descripcion = '';
  String modalidad = '';
  String ubicacion = '';
  String area = '';
  String tiempo = '';
  int vacantes = 0;
  String experiencia = '';
  double salario = 0.0;
  String? fechaRegistro;
  String estado = '';
  int empresaId = 0;

  @override
  void initState() {
    super.initState();
    titulo = widget.oferta?.titulo ?? '';
    subtitulo = widget.oferta?.subTitulo ?? '';
    descripcion = widget.oferta?.descripcion ?? '';
    modalidad = widget.oferta?.modalidad ?? '';
    ubicacion = widget.oferta?.ubicacion ?? '';
    area = widget.oferta?.area ?? '';
    tiempo = widget.oferta?.tiempo ?? '';
    vacantes = widget.oferta?.vacantes ?? 0;
    experiencia = widget.oferta?.experiencia ?? '';
    salario = widget.oferta?.salario ?? 0.0;
    estado = widget.oferta?.estado ?? '';
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
              Text('Nueva Oferta ${widget.idEmpresa}', style: textStyle.titleLarge),
              const Divider(),
              CustomTextFormField(
                label: 'Título',
                defaultValue: titulo,
                onChanged: (p0) {
                  titulo = p0;
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Campo requerido';
                  return null;
                },
              ),
              CustomTextFormField(
                label: 'Subtítulo',
                defaultValue: subtitulo,
                onChanged: (p0) {
                  subtitulo = p0;
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Campo requerido';
                  return null;
                },
              ),
              CustomTextFormField(
                label: 'Descripción',
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
              
              Row(
                children: [
                  Expanded(
                    child: ModalidadCheckBox(
                      modalidadInicial: 'Presencial', 
                      onModalidadChanged: (p0) {
                        modalidad = p0;
                      },
                    ),
                  ),

                  Expanded(
                    child: ProvinciaBox(
                      onSelected: (p0) {
                        ubicacion =  ref.read(provinciaProvider.notifier).getProvinciaById(p0);
                      },
                    ),
                  ),
                ],
              ),

              AreaTrabajoCheckBox(
                areaInicial: 'Sistemas', 
                onAreaChanged: (p0) {
                  area = p0;
                },
              ),

              CustomTextFormField(
                label: 'Tiempo',
                hintText: '6 meses ,1 año , indefinido, etc',
                defaultValue: tiempo,
                onChanged: (p0) {
                  tiempo = p0;
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Campo requerido';
                  return null;
                },
              ),
              CustomTextFormField(
                label: 'Vacantes',
                keyboardType: TextInputType.number,
                defaultValue: vacantes.toString(),
                onChanged: (p0) {
                  vacantes = int.tryParse(p0) ?? 0;
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Campo requerido';
                  return null;
                },
              ),
              CustomTextFormField(
                label: 'Experiencia',
                hintText: 'Ejm : 2 años de experiencia',
                defaultValue: experiencia,
                onChanged: (p0) {
                  experiencia = p0;
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Campo requerido';
                  return null;
                },
              ),
              CustomTextFormField(
                label: 'Salario',
                hintText: '460',
                keyboardType: TextInputType.number,
                defaultValue: salario.toString(),
                onChanged: (p0) {
                  salario = double.tryParse(p0) ?? 0.0;
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Campo requerido';
                  return null;
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
                      final isValid = _formKey.currentState?.validate();
                      if (!isValid!) return;
                      final newOferta = Oferta(
                        id: widget.oferta?.id,
                        titulo: titulo,
                        subTitulo: subtitulo,
                        descripcion: descripcion,
                        modalidad: modalidad ,
                        ubicacion: ubicacion,
                        area: area,
                        tiempo: tiempo,
                        vacantes: vacantes,
                        experiencia: experiencia,
                        salario: salario,
                        fechaRegistro: DateTime.now().toString(),
                        estado: 'A',
                        empresa: Empresa(id: widget.idEmpresa)
                      );
                      final apiRes = await ref.read(ofertaEmpresaProvider.notifier).save(newOferta);
                      if (apiRes) {
                        ref.read(ofertaEmpresaProvider.notifier).getOfertasByEmpresa(widget.idEmpresa);
                        context.pop();
                      }else{
                        customSnackBarMessage(context, 'Error al crear registro');
                      }
                    },
                    child: const Text('Guardar'),
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
