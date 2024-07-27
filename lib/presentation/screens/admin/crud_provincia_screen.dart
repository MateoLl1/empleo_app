
// ignore_for_file: use_build_context_synchronously

import 'package:empleo_app/domain/domain.dart';
import 'package:empleo_app/presentation/providers/providers.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CrudProvinciaScreen extends ConsumerStatefulWidget {
  const CrudProvinciaScreen({super.key});

  @override
  CrudProvinciaScreenState createState() => CrudProvinciaScreenState();
}

class CrudProvinciaScreenState extends ConsumerState<CrudProvinciaScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(provinciaProvider.notifier).getProvincia();
  }
  
  @override
  Widget build(BuildContext context) {
    final provincias = ref.watch(provinciaProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (context) => Dialog(
              child: SizedBox(
                width: size.width*.6,
                child: const ProvinciaFormView()
              )
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Lista de provincias'),),
      body: ListView.builder(
        itemCount: provincias.length,
        itemBuilder: (context, index) {
          final provincia = provincias[index];
          return CustomRowProvincia(index: index+1,provincia: provincia,);
        },
      ),
    );
  }
}



class ProvinciaFormView extends ConsumerStatefulWidget {
  final Provincia? provincia;
  const ProvinciaFormView({
    super.key, this.provincia,
  });

  @override
  ProvinciaFormViewState createState() => ProvinciaFormViewState();
}

class ProvinciaFormViewState extends ConsumerState<ProvinciaFormView> {

  final _formKey = GlobalKey<FormState>();
  String nombre = '';

  @override
  void initState() {
    super.initState();
    nombre = widget.provincia?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              Text('Nuevo provincia',style: textStyle.titleLarge,),
              const Divider(),
              
              CustomTextFormField(
                label: 'Nombre provincia',
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
                      final isValid = _formKey.currentState?.validate();
                      if(!isValid!) return;
                      final newProvincia = Provincia(
                        id: widget.provincia?.id,
                        nombre: nombre
                      );
                      final apiRes = await ref.read(provinciaProvider.notifier).save(newProvincia);
                      if (apiRes == null) {
                        showCustomAlertDialog(context, 'Error al insertar');return;
                      }
                      customSnackBarMessage(context, 'Insertado');
                      context.pop();
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