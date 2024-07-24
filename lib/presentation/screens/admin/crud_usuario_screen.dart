
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Placeholder();
        },
      ),
    );
  }
}



class UserFormView extends StatefulWidget {
  const UserFormView({
    super.key,
  });

  @override
  State<UserFormView> createState() => _UserFormViewState();
}

class _UserFormViewState extends State<UserFormView> {

  final _formKey = GlobalKey<FormState>();


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
              const Row(
                children: [
                  Expanded(child: CustomTextFormField(label: 'Nombre')),
                  SizedBox(width: 5,),
                  Expanded(child: CustomTextFormField(label: 'Apellido')),
                ],
              ),
              const Row(
                children: [
                  Expanded(child: CustomTextFormField(label: 'Correo electronico')),
                  SizedBox(width: 5,),
                  Expanded(child: CustomTextFormField(label: 'Cedula')),
                ],
              ),
              
              Wrap(
                children: [
                  TipoUsuarioBox(
                    onSelected: (p0) {
                    },
                  ),
                  ProvinciaBox(
                    onSelected: (p0) {
                      
                    },
                  ),
                  SexoBox(
                    onSelected: (p0) {
                      print(p0);
                    },
                  ),
              
                  Expanded(
                    child: CalendarDatePicker(
                      initialDate: null,
                      firstDate: DateTime(1950, 1, 1), 
                      lastDate: DateTime.now(),
                      onDateChanged: (value) {
                        print('Fecha seleccionada: $value');
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
                    onPressed: (){}, 
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