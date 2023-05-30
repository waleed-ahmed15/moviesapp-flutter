import 'package:flutter/material.dart';
import 'package:moviesapp/utils/app_colors.dart';

class InvertedCurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.light_blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    var path = Path();
    path.moveTo(0, size.height / 2); // Start point
    path.cubicTo(
      size.width / 4, 0, // First control point
      size.width * 3 / 4, 0, // Second control point
      size.width, size.height / 2, // End point
    );
    // Cubic Bezier curve:
    // First control point: (size.width / 4, 0)
    // Second control point: (size.width * 3 / 4, 0)
    // End point: (size.width, size.height / 2)

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(InvertedCurvedLinePainter oldDelegate) => false;
}
