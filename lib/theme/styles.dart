import 'package:flutter/material.dart';
import '../functions/build_bootom_sheet.dart';
import 'colors.dart';

ButtonStyle buttonElevatedStyle() {
  return ButtonStyle(
      fixedSize: MaterialStateProperty.all(const Size(200, 30)),
      backgroundColor: MaterialStateProperty.all(color4),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)))));
}
