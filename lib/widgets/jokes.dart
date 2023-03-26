import 'dart:developer' as developer;

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/API/api.dart';
import 'package:flutter_application_1/Widgets/joke_card.dart';
import 'package:flutter_application_1/api/joke_model.dart';
import 'package:flutter_application_1/database/local_storage.dart';
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
  final storage = LocalStorage();
  JokeModel? _currentJoke;

  Future<void> onSwipe(index, direction) async {
    if (direction == AppinioSwiperDirection.right && _currentJoke != null) {
      storage.put(_currentJoke!);
    }
    storage.printStorage();
    _currentJoke = _cards.last.model;
    await addJoke();
  }

  Future<void> addJoke() async {
    final joke = await API.loadRandom();
    if (joke != null) {
      try {
        setState(() {
          _cards.insert(0, JokeCard(model: joke));
        });
      } catch (e) {
        developer.log("Couldn't parse the URL");
      }
    } else {
      developer.log("Couldn't load more cards");
    }
  }

  void swipeLike() {
    _controller.swipeRight();
  }

  void swipeDislike() {
    _controller.swipeLeft();
  }

  void initializeCards() async {
    for (int i = 0; i < 3; i++) {
      await addJoke();
    }
    _currentJoke = _cards.last.model;
  }

  @override
  initState() {
    super.initState();
    initializeCards();
    storage.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    storage.close();
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
          swipeLike: swipeLike,
          swipeDislike: swipeDislike,
        )
      ],
    );
  }
}
