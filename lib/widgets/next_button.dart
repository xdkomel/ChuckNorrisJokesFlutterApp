import 'package:flutter/material.dart';

import '../styles/color_styles.dart';
import '../styles/text_styles.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.swipeNext});
  final VoidCallback swipeNext;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: TextButton(
          onPressed: swipeNext,
          child: Text(
            "Next",
            style:
                LocalTextStyles.button.stylize(LocalColorStyles.accent.value),
          )));
}
