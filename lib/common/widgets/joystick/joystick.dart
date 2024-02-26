import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:robotics_g11/common/widgets/joystick/joystick_painter.dart';
import 'package:robotics_g11/common/widgets/widget_view.dart';

class JoyStick extends StatefulWidget {
  const JoyStick({Key? key}) : super(key: key);

  @override
  _JoyStickController createState() => _JoyStickController();
}

class _JoyStickController extends State<JoyStick> {
  double joystickX = 0.0;
  double joystickY = 0.0;
  double joystickSize = 100.0;
  double knobSize = 50.0;
  Offset _dragOffset = Offset.zero;

  void _onHorizontalDragUpdate(DragUpdateDetails details, double radius) {
    // double radius =  MediaQuery.of(context).size.width / 2;
    // final diff = _dragOffset - details.localPosition;
    // print('Drag offset: ${diff.distance}');

    // double joystickX = details.localPosition.dx;
    // double joystickY = details.localPosition.dy;
    //
    // // Keep the knob within the bounds of the joystick
    // double distance = sqrt(joystickX * joystickX + joystickY * joystickY);
    // if (distance > joystickSize / 2) {
    //   double angle = atan2(joystickY, joystickX);
    //   joystickX = (radius / 2) * cos(angle);
    //   joystickY = (radius / 2) * sin(angle);
    //   _setDragOffset(Offset(joystickX, joystickY));
    //   return;
    // }

    _setDragOffset(details.localPosition);


    // double dx = details.localPosition.dx;
    // double dy = details.localPosition.dy;
    // double distance = sqrt(dx * dx + dy * dy);
    // if (distance <= radius) {
    //   // final xPosition = details.globalPosition.dx - radius;
    //   // final yPosition = details.globalPosition.dy - MediaQuery.of(context).size.height / 2;
    //   _setDragOffset(Offset(dx, dy));
    // } else {
    //   // Keep the object within the circular constraint
    //   double angle = atan2(dy, dx);
    //   final xPosition = radius * cos(angle);
    //   final yPosition = radius * sin(angle);
    //   _setDragOffset(Offset(xPosition, yPosition));
    //
    // }
  }

  void _setDragOffset(Offset dragOffset) {
    setState(() {
      _dragOffset = dragOffset;
    });
  }

  @override
  Widget build(BuildContext context) => _JoyStickView(this);
}

class _JoyStickView extends WidgetView<JoyStick, _JoyStickController> {
  const _JoyStickView(_JoyStickController state) : super(state);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final radius = screenSize.width * 0.5;
    return Container(
      width: radius,
      height: radius,
      child: GestureDetector(
        onPanUpdate: (details) => state._onHorizontalDragUpdate(details, radius),
        onPanEnd: (details) => state._setDragOffset(Offset.zero),
        onTapUp: (details) => state._setDragOffset(Offset.zero),
        child: CustomPaint(
          painter: JoyStickPainter(
              // state.joystickX, state.joystickY, joyStickSize, state.knobSize
            offset: state._dragOffset,
              // size: Size(screenSize.width * 0.5, screenSize.width),
              // // slidingButtonEndCallback: _onSlideEnd,
              // // chevronColor: widget.chevronColor ?? colorScheme.primary,
              // // dragDetails: _dragOffset,
              // // trackColor: widget.trackColor ?? colorScheme.primary,
              // // thumbColor: widget.thumbColor ?? colorScheme.surface,
              // // thumbPathEraserColor: widget.thumbPathEraserColor ?? colorScheme.primary,
              // // hint: widget.label,
              // // textStyle: theme.textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 17),
              // offset: state._dragOffset,
          ),
        ),
      ),
    );
  }
}
