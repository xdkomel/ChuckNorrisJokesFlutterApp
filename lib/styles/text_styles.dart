import 'package:flutter/material.dart';

class TextStylizingActions {
  static TextStyle buttonStyle(Color color) => TextStyle(
      fontSize: 18.0,
      height: 1.25,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w600,
      color: color);
  static TextStyle bodyStyle(Color color) => TextStyle(
      fontSize: 18.0,
      height: 1.25,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w400,
      color: color);
  static TextStyle headingStyle(Color color) => TextStyle(
      fontSize: 36.0,
      height: 1.2,
      letterSpacing: -0.5,
      fontWeight: FontWeight.w400,
      color: color);
  static TextStyle boldHeadingStyle(Color color) => TextStyle(
      fontSize: 36.0,
      height: 1.2,
      letterSpacing: -0.5,
      fontWeight: FontWeight.w600,
      color: color);
}

enum LocalTextStyles {
  button(TextStylizingActions.buttonStyle),
  body(TextStylizingActions.bodyStyle),
  heading(TextStylizingActions.headingStyle),
  boldHeading(TextStylizingActions.boldHeadingStyle);

  const LocalTextStyles(this.stylize);
  final TextStyle Function(Color color) stylize;
}
