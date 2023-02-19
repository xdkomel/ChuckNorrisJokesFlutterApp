import 'package:flutter/material.dart';

import '../styles/color_styles.dart';
import '../styles/text_styles.dart';

class CardOverlay extends StatelessWidget {
  const CardOverlay({required this.isOverlayShown, super.key});

  final bool isOverlayShown;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      opacity: isOverlayShown ? 1.0 : 0.0,
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: LocalColorStyles.accent.value.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Text("Double tap to open the joke in browser",
            style: LocalTextStyles.body.stylize(Colors.white)),
      ),
    );
  }
}
