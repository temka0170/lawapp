import 'package:flutter/material.dart';

//home hesgiin carousel border
class MainWave1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xfff8931f).withOpacity(0.4)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.00, size.height * 0.58);
    path_0.lineTo(size.width * 0.00, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.93);
    path_0.quadraticBezierTo(size.width * 0.72, size.height * 0.65,
        size.width * 0.51, size.height * 0.64);
    path_0.cubicTo(size.width * 0.32, size.height * 0.62, size.width * 0.24,
        size.height * 0.69, size.width * 0.18, size.height * 0.68);
    path_0.quadraticBezierTo(size.width * 0.11, size.height * 0.69,
        size.width * 0.00, size.height * 0.58);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MainWave2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xffff4f5fa)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.00, size.height * 0.66);
    path_0.lineTo(size.width * 0.00, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.quadraticBezierTo(size.width * 0.72, size.height * 0.71,
        size.width * 0.51, size.height * 0.69);
    path_0.cubicTo(size.width * 0.32, size.height * 0.67, size.width * 0.24,
        size.height * 0.75, size.width * 0.18, size.height * 0.75);
    path_0.quadraticBezierTo(size.width * 0.11, size.height * 0.76,
        size.width * 0.00, size.height * 0.66);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
