import 'package:flutter/material.dart';

//calculator, more page carousel bottom curved border
class FirstWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xffff4f5fa)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.5);
    path_0.quadraticBezierTo(size.width * 0.95, size.height * 0.73,
        size.width * 0.82, size.height * 0.80);
    path_0.cubicTo(size.width * 0.72, size.height * 0.85, size.width * 0.68,
        size.height * 0.78, size.width * 0.47, size.height * 0.78);
    path_0.quadraticBezierTo(
        size.width * 0.21, size.height * 0.80, 0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SecondWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = new Paint()
      ..color = Color(0xfff8931f).withOpacity(0.4)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.93);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.4);
    path_0.quadraticBezierTo(size.width * 0.94, size.height * 0.65,
        size.width * 0.81, size.height * 0.74);
    path_0.cubicTo(size.width * 0.67, size.height * 0.79, size.width * 0.63,
        size.height * 0.73, size.width * 0.45, size.height * 0.72);
    path_0.quadraticBezierTo(
        size.width * 0.24, size.height * 0.72, 0, size.height * 0.93);
    path_0.close();

    canvas.drawPath(path_0, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
