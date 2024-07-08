

import 'package:flutter/material.dart';
import 'package:empleo_app/presentation/widgets/widgets.dart';

class SearchLanding extends StatelessWidget {
  const SearchLanding({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width*.1,
        vertical: 150
      ),
      decoration: BoxDecoration(
        color: colors.onInverseSurface,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(300))
      ),
      child: Column(
        children: [
      
          Text('¡Ahora es el momento de cambiar!',style: textStyle.titleLarge,),
      
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: (size.width>=640)  ? size.width*.5 : size.width,
                child: const CustomTextFormField(label: 'Cargo o empresa', icon: Icons.work,),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {}, 
                  label: const Text('Buscar empleo'),
                  icon: const Icon(Icons.search),
                ),
              ),
            ],
          ),
      
        ],
      ),
    );
  }
}