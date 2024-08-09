

import 'package:empleo_app/presentation/providers/data/oferta_empresa_provider.dart';
import 'package:empleo_app/presentation/screens/admin/crud_ofertas_by_empresa.dart';
import 'package:flutter/material.dart';
import 'package:empleo_app/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OfertaCard extends ConsumerWidget {
  final bool isAdmin;
  final Oferta oferta;

  const OfertaCard({
    super.key, required this.oferta, 
    this.isAdmin = true
  });

  @override
  Widget build(BuildContext context,ref) {
    final size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(oferta.empresa?.logo ?? ''),
                  radius: 20.0,
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      oferta.empresa?.nombre ?? 'Empresa desconocida',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      oferta.fechaRegistro,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              oferta.titulo,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              oferta.subTitulo,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              oferta.descripcion,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4.0),
                    Text(oferta.ubicacion),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.business_center, size: 16, color: Colors.grey),
                    const SizedBox(width: 4.0),
                    Text(oferta.area),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 4.0),
                    Text(oferta.tiempo),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.attach_money, size: 16, color: Colors.grey),
                    const SizedBox(width: 4.0),
                    Text('\$${oferta.salario.toString()}'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.people, size: 16, color: Colors.grey),
                    const SizedBox(width: 4.0),
                    Text('${oferta.vacantes} vacantes'),
                  ],
                ),
                !isAdmin ? TextButton(
                  onPressed: () {
                    // Acción al aplicar
                  },
                  child: const Text('Aplicar ahora'),
                ):Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: SizedBox(
                              width: size.width * .6, 
                              child: OfertaFormView(
                                  oferta: oferta,
                                  idEmpresa: oferta.empresa?.id ?? 1,
                                )
                              )
                            ),
                        );
                      }, 
                      icon: const Icon(Icons.edit)
                    ),
                    const SizedBox(width: 20,),
                    IconButton.filled(
                      onPressed: (){
                        ref.read(ofertaEmpresaProvider.notifier).deleteOfertaById(
                          oferta.empresa!.
                          id!, oferta.id!
                        );
                      }, 
                      icon: const Icon(Icons.delete)
                    ),
                    const SizedBox(width: 10,),
                  ],
                ) ,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
