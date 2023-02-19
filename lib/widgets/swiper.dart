import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/joke_card.dart';
import 'package:flutter_application_1/styles/color_styles.dart';
import 'package:flutter_application_1/styles/text_styles.dart';

class Swiper extends StatelessWidget {
  const Swiper(
      {super.key,
      required this.controller,
      required this.cards,
      required this.onSwipe,
      required this.swipeNext});

  final AppinioSwiperController controller;
  final List<JokeCard> cards;
  final Function onSwipe;
  final VoidCallback swipeNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: AppinioSwiper(
              controller: controller, cards: cards, onSwipe: onSwipe),
        ),
        Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: TextButton(
                onPressed: swipeNext,
                child: Text(
                  "Next",
                  style: LocalTextStyles.button
                      .stylize(LocalColorStyles.accent.value),
                ))),
      ],
    );
  }
}
