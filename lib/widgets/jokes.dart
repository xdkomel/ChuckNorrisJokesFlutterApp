import 'dart:developer' as developer;

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/API/api.dart';
import 'package:flutter_application_1/Widgets/joke_card.dart';
import 'package:flutter_application_1/widgets/bad_internet_connection.dart';
import 'package:flutter_application_1/widgets/swiper.dart';

class Jokes extends StatefulWidget {
  const Jokes({super.key});

  @override
  State<StatefulWidget> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  final List<JokeCard> _cards = [];
  final AppinioSwiperController _controller = AppinioSwiperController();

  Future<void> onSwipe(i, c) async {
    await addJoke();
  }

  Future<void> addJoke() async {
    final joke = await API.upload();
    if (joke != null) {
      try {
        setState(() {
          _cards.insert(
              0,
              JokeCard(
                jokeText: joke.value,
                url: Uri.parse(joke.url),
              ));
        });
      } catch (e) {
        developer.log("Couldn't parse the URL");
      }
    } else {
      developer.log("Couldn't load more cards");
    }
  }

  void swipeNext() {
    _controller.swipe();
  }

  void initializeCards() {
    for (int i = 0; i < 3; i++) {
      addJoke();
    }
  }

  @override
  initState() {
    super.initState();
    initializeCards();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BadInternetConnection(initializeCards: initializeCards),
        Swiper(
          controller: _controller,
          cards: _cards,
          onSwipe: onSwipe,
          swipeNext: swipeNext,
        )
      ],
    );
  }
}
