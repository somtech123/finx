import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleBottomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..arcToPoint(Offset(size.width, size.height),
          radius: Radius.circular(20.r), clockwise: false)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
