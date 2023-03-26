import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class NextButton extends StatelessWidget {
  const NextButton(
      {super.key,
      required this.swipeNext,
      required this.text,
      required this.color});
  final VoidCallback swipeNext;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: TextButton(
          onPressed: swipeNext,
          child: Text(
            text,
            style: LocalTextStyles.button.stylize(color),
          )));
}
