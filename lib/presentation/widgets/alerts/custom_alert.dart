import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  const CustomAlert({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,style: textStyle.titleLarge,),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: context.pop, 
          child: const Text('Aceptar')
        )
      ],
    );
  }
}

showCustomAlertDialog(BuildContext context,String title){
  showDialog(
    context: context, builder: (context) => CustomAlert(title: title,),
  );
}