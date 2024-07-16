


import 'package:flutter/material.dart';

void customSnackBarMessage(BuildContext context,String message){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    )
  );

}