import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../styles/color_styles.dart';
import '../styles/shadow_styles.dart';
import '../styles/text_styles.dart';

class CardContents extends StatelessWidget {
  const CardContents({required this.jokeText, super.key});

  final String jokeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 24.0, bottom: 24.0, left: 16.0, right: 16.0),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: [LocalShadowStyles.card.shadow]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: AutoSizeText(
            jokeText,
            wrapWords: false,
            minFontSize: 18.0,
            style: LocalTextStyles.heading
                .stylize(LocalColorStyles.darkGray.value),
          )),
        ],
      ),
    );
  }
}
