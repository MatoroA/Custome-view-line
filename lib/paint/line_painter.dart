import 'dart:math';

import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final double progress;

  LinePainter({this.progress = 0.5});

  static final linePaint = Paint()
    ..color = Colors.amber
    ..style = PaintingStyle.stroke
    ..strokeWidth = 6
    ..strokeCap = StrokeCap.round;

  static const _gap = 12.0;

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height / 2;

    final widthProgress = size.width * progress;
    final point1 = max(0.0, widthProgress - _gap);
    final point2 = min(widthProgress, size.width);

    canvas.drawLine(Offset(0, height), Offset(point1, height), linePaint);
    canvas.drawLine(
      Offset(point2 + _gap, height),
      Offset(size.width, height),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
