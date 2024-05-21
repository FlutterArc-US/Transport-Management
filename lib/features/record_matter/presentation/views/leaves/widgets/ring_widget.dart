import 'dart:math';

import 'package:flutter/material.dart';

class RingPainter extends CustomPainter {
  final double progress;
  final double total;

  RingPainter({
    required this.progress,
    required this.total,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 10.0;
    double radius = (size.width / 2) - strokeWidth / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint backgroundPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Paint foregroundPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    double angle = 2 * pi * (progress / total);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RingWidget extends StatelessWidget {
  final double progress;
  final double total;
  final double radius;

  const RingWidget({
    required this.progress,
    required this.total,
    required this.radius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: RingPainter(progress: progress, total: total),
    );
  }
}
