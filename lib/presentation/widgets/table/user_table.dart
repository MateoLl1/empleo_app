import 'package:empleo_app/presentation/providers/data/user_provider.dart';
import 'package:empleo_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:empleo_app/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserTable extends ConsumerWidget {
  final Usuario user;
  final int index;
  const UserTable({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context,ref) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30,),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(20),
          1: FixedColumnWidth(150),
          2: FixedColumnWidth(150),
          3: FixedColumnWidth(200),
          4: FixedColumnWidth(150),
          5: FixedColumnWidth(150),
          6: FixedColumnWidth(50),
          7: FixedColumnWidth(50),
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
                child: Text(user.nombre, style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.cedula, style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.email, style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.tpUsuario?.nombre ?? '', style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.provincia?.nombre ?? '', style: textStyle.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                    context: context, 
                    builder: (context) => Dialog(
                      child: SizedBox(
                        width: size.width*.6,
                        child: UserFormView(user: user,)
                      )
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
                    ref.read(userProvider.notifier).deleteUserById(user.id!);
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
