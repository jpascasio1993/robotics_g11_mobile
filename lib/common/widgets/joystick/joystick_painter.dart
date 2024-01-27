import 'dart:math';
import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class JoyStickPainter extends CustomPainter {
  final Offset offset;

  JoyStickPainter({required this.offset});

  @override
  void paint(Canvas canvas, Size size) {

    final thumbPaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final thumbContainerPaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    // final scaleX = constraints.maxWidth / imageSize.width;
    // final scaleY = constraints.maxHeight / imageSize.height;
    final thumbContainerOffset = Offset(size.width / 2, size.height / 2);


    double radius = size.width;
    double thumbRadius = size.width * 0.1;
    // Keep the knob within the bounds of the joystick

    final thumbContainerRect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius);
    final thumbRect = Rect.fromCircle(center: offset, radius: size.width * 0.1);
    final isOverlap = thumbContainerRect.overlaps(thumbRect);

    double joystickX = offset.dx - size.width;
    double joystickY = offset.dy - size.height;

    double distance = sqrt(joystickX * joystickX + joystickY * joystickY);

    print('distance:: ${distance} :: ${radius} :: $isOverlap');
    if (!(distance <= size.width)) {
      double angle = atan2(joystickY, joystickX);
      print('angle:: $angle');
      joystickX = radius + thumbRadius * cos(angle);
      joystickY = radius + thumbRadius * sin(angle);
    }

    Offset thumbOffset = offset == Offset.zero ? thumbContainerOffset : Offset(  joystickX,   joystickY);



    // final thumbPath = Path()..addOval(thumbRect);
    // final thumbContainerPath = Path()..addOval(thumbContainerRect);

    // canvas
    // ..drawPath(thumbContainerPath, thumbContainerPaint)..drawPath(thumbPath, thumbPaint);
    canvas
    ..drawCircle(thumbContainerOffset, radius, thumbContainerPaint)
    ..drawCircle(thumbOffset, thumbRadius, thumbPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // final thumbContainerOffset = Offset(size.width / 2, size.height / 2);
    // final thumbOffset = offset == Offset.zero ? thumbContainerOffset : Offset(offset.dx, offset.dy);
    // final thumbContainerRect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width);
    // final thumbRect = Rect.fromCircle(center: thumbOffset, radius: size.width * 0.1);
    // print('offset dy: ${offset.dy} :: width ');
    // final overlaps = thumbRect.overlaps(thumbContainerRect);
    // final isInside = isFaceBoundingBoxInsideTheViewFinder(scaledFaceBoundingBox: thumbRect, viewFinder: thumbContainerRect, radius: size.width, acceptableDistanceThreshold: 100);
    return offset != (oldDelegate as JoyStickPainter).offset;
  }

}

// class JoyStickPainter extends CustomPainter {
//   final double joystickX;
//   final double joystickY;
//   final double joystickSize;
//   final double knobSize;
//
//   JoyStickPainter(this.joystickX, this.joystickY, this.joystickSize, this.knobSize);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;
//
//     Paint paint2 = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke;
//
//     // Draw joystick base
//     canvas.drawCircle(
//       Offset(joystickSize / 2, joystickSize / 2),
//       joystickSize / 2,
//       paint2,
//     );
//
//     // Draw joystick knob
//     canvas.drawCircle(
//       Offset(joystickSize / 2 + joystickX, joystickSize / 2 + joystickY),
//       knobSize / 2,
//       paint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }