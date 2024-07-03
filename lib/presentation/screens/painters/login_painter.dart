

import 'package:flutter/material.dart';

class LoginPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final pencil = Paint();
    pencil.color = Colors.grey;
    pencil.strokeWidth = 10;
    pencil.style = PaintingStyle.fill;

    path.moveTo(size.width*.15, 0);
    path.lineTo(size.width*.53, size.height*.38);
    path.arcToPoint(
      Offset(size.width*.155, size.height*.7),
      radius: Radius.circular(size.width*.05)
    );
    path.lineTo(0, size.height*.55);
    path.lineTo(0, 0);
    path.lineTo(size.width*.2, 0);
    
    canvas.drawPath(path, pencil);
    path.reset();
    // Aplicar gradiente en lugar de color sólido
    // ignore: prefer_const_constructors
    final gradient =   LinearGradient(
      colors: const [Colors.blueAccent, Colors.blueGrey],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    pencil.shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    path.moveTo(size.width*.1, 0);
    path.lineTo(size.width*.48, size.height*.38);
    path.arcToPoint(
      Offset(size.width*.18, size.height*.68),
      radius: Radius.circular(size.width*.2)
    );
    path.lineTo(0, size.height*.5);
    path.lineTo(0, 0);
    path.lineTo(size.width*.1, 0);
    canvas.drawPath(path, pencil);

    path.reset();


    path.moveTo(size.width*.3, 0);
    path.lineTo(size.width*.7, 0);
    path.arcToPoint(
      Offset(size.width*.5, size.height*.15),
      radius: const Radius.circular(1)
    );
    path.lineTo(size.width*.37, 0);

    canvas.drawPath(path, pencil);

    path.reset();

    path.moveTo(0, size.height*.6);
    path.lineTo(size.width*.2, size.height*.8);
    path.arcToPoint(
      Offset(size.width*.1, size.height*.9),
      radius: const Radius.circular(1)
    );
    path.lineTo(0, size.height*.8);
    path.lineTo(0, size.height*.6);
    canvas.drawPath(path, pencil);

    path.reset();
    final pencil2 = Paint();
    pencil2.color = Colors.amber;
    path.moveTo(size.width*.4, size.height);
    path.arcToPoint(
      Offset(size.width*.65, size.height*.9),
      radius: const Radius.circular(1)
    );
    path.lineTo(size.width*.71, size.height);
    pencil.color = Colors.amber;

    canvas.drawPath(path, pencil2);

  }

  @override
  bool shouldRepaint(LoginPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LoginPainter oldDelegate) => false;
}