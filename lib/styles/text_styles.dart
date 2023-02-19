import 'package:flutter/material.dart';

enum LocalTextStyles {
  button(18.0, 1.25, -0.1, FontWeight.w600),
  body(18.0, 1.25, -0.1, FontWeight.w400),
  heading(32.0, 1.2, -0.5, FontWeight.w400),
  boldHeading(32.0, 1.2, -0.5, FontWeight.w700);

  const LocalTextStyles(
      this.fontSize, this.height, this.letterSpacing, this.fontWeight);
  final double fontSize;
  final double height;
  final double letterSpacing;
  final FontWeight fontWeight;

  TextStyle stylize(Color color) => TextStyle(
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      color: color);
}
