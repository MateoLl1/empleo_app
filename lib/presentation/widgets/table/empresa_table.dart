
import 'package:empleo_app/presentation/providers/providers.dart';
import 'package:empleo_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:empleo_app/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EmpresaTable extends ConsumerWidget {
  final Empresa empresa;
  final int index;

  const EmpresaTable({
    Key? key,
    required this.empresa,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(10),
          1: FixedColumnWidth(100),
          2: FixedColumnWidth(100),
          3: FixedColumnWidth(100),
          4: FixedColumnWidth(100),
          5: FixedColumnWidth(100),
          6: FixedColumnWidth(100),
          7: FixedColumnWidth(70),
          8: FixedColumnWidth(10),
          9: FixedColumnWidth(10),
        },
        border: TableBorder.all(
          color: colors.onSurface,
          width: 1,
        ),
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: colors.inversePrimary,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('$index .', style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(empresa.nombre!, style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(empresa.ruc!, style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(empresa.email!, style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(empresa.owner!, style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(empresa.descripcion!, style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(empresa.eslogan!, style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 5),
                child: FilledButton(
                  onPressed: (){
                    context.go('/crud-oferta/${empresa.id}');
                  }, 
                  child: const Text('Ofertas')
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: SizedBox(
                          width: size.width * .6,
                          child: EmpresaFormView(empresa: empresa),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    ref.read(empresaProvider.notifier).deleteEmpresaById(empresa.id!);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
