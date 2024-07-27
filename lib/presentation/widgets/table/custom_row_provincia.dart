
import 'package:empleo_app/domain/domain.dart';
import 'package:empleo_app/presentation/providers/providers.dart';
import 'package:empleo_app/presentation/screens/admin/crud_provincia_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomRowProvincia extends ConsumerWidget {
  final Provincia provincia;
  final int index;
  const CustomRowProvincia({super.key, required this.provincia, required this.index});

  @override
  Widget build(BuildContext context,ref) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      decoration: BoxDecoration(
        color: colors.inversePrimary,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [

          Text('$index .'),
          const SizedBox(width: 20,),
          Text(provincia.nombre!),
          const Spacer(),

          IconButton(
            onPressed: (){
              showDialog(
            context: context, 
            builder: (context) => Dialog(
              child: SizedBox(
                width: size.width*.6,
                child: ProvinciaFormView(provincia: provincia,)
              )
            ),
          );
            }, 
            icon: const Icon(Icons.edit)
          ),
          IconButton(
            onPressed: (){
              ref.read(provinciaProvider.notifier).deleteProvicinciaById(provincia.id!);
            }, 
            icon: const Icon(Icons.delete)
          ),


        ],
      ),
    );
  }
}