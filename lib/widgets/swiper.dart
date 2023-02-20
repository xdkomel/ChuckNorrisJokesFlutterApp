import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/joke_card.dart';
import 'package:flutter_application_1/widgets/next_button.dart';

class Swiper extends StatelessWidget {
  Swiper(
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
      verticalDirection: VerticalDirection.up,
      children: [
        NextButton(swipeNext: swipeNext),
        Expanded(
          child: AppinioSwiper(
              controller: controller, cards: cards, onSwipe: onSwipe),
        )
      ],
    );
  }
}
