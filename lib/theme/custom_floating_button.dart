import 'package:flutter/material.dart';

class CustomFloatingButton extends ShapeBorder {
  const CustomFloatingButton();

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(0.5 * rect.width, rect.height * 0.35)
      ..cubicTo(0.2 * rect.width, rect.height * 0.1, -0.25 * rect.width,
          rect.height * 0.6, 0.5 * rect.width, rect.height)
      ..moveTo(0.5 * rect.width, rect.height * 0.35)
      ..cubicTo(0.8 * rect.width, rect.height * 0.1, 1.25 * rect.width,
          rect.height * 0.6, 0.5 * rect.width, rect.height)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
