import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/joke_card.dart';
import 'package:flutter_application_1/widgets/next_button.dart';

import '../styles/color_styles.dart';

class Swiper extends StatelessWidget {
  const Swiper(
      {super.key,
      required this.controller,
      required this.cards,
      required this.onSwipe,
      required this.swipeLike,
      required this.swipeDislike});

  final AppinioSwiperController controller;
  final List<JokeCard> cards;
  final Function onSwipe;
  final VoidCallback swipeLike;
  final VoidCallback swipeDislike;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      verticalDirection: VerticalDirection.up,
      children: [
        Row(
          children: [
            Expanded(
                child: NextButton(
                    swipeNext: swipeDislike,
                    text: "Dislike",
                    color: LocalColorStyles.red.value)),
            Expanded(
                child: NextButton(
                    swipeNext: swipeLike,
                    text: "Like",
                    color: LocalColorStyles.accent.value)),
          ],
        ),
        Expanded(
          child: AppinioSwiper(
              controller: controller, cards: cards, onSwipe: onSwipe),
        )
      ],
    );
  }
}
