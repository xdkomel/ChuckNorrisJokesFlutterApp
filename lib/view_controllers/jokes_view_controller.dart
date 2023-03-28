import 'dart:developer' as developer;

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../API/api.dart';
import '../Widgets/joke_card.dart';
import '../api/joke_model.dart';
import '../database/local_storage.dart';
import 'joke_cards_notifier.dart';

class JokesViewController {
  late final StateNotifierProvider<JokeCardsNotifier, List<JokeCard>> provider;
  late final Ref ref;
  final AppinioSwiperController controller = AppinioSwiperController();
  final storage = LocalStorage();
  final confettiController =
      ConfettiController(duration: const Duration(seconds: 1));
  JokeModel? _currentJoke;

  JokesViewController() {
    provider = StateNotifierProvider((ref) {
      this.ref = ref;
      return JokeCardsNotifier([]);
    });
  }

  void initState() async {
    storage.initialize();
    final jokeCards = await initializeCards();
    ref.read(provider.notifier).addMultipleCards(jokeCards);
    _currentJoke = ref.read(provider.notifier).getLast()?.model;
    ref.notifyListeners();
  }

  void updateCards() async {
    final jokeCards = await initializeCards();
    ref.read(provider.notifier).addMultipleCards(jokeCards);
    _currentJoke = ref.read(provider.notifier).getLast()?.model;
    ref.notifyListeners();
  }

  void dispose() {
    storage.close();
    confettiController.dispose();
  }

  Future<void> onSwipe(index, direction) async {
    if (direction == AppinioSwiperDirection.right && _currentJoke != null) {
      storage.put(_currentJoke!);
      confettiController.play();
    }
    final newJoke = await generateJokeModel();
    if (newJoke != null) {
      ref.read(provider.notifier).addCard(JokeCard(model: newJoke));
      _currentJoke = ref.read(provider.notifier).getLast()?.model;
    }
  }

  Future<JokeModel?> generateJokeModel() async {
    final joke = await API.loadRandom();
    if (joke != null) {
      return joke;
    }
    developer.log("Couldn't load a card");
    return null;
  }

  void swipeLike() {
    controller.swipeRight();
  }

  void swipeDislike() {
    controller.swipeLeft();
  }

  Future<List<JokeCard>> initializeCards() async {
    final resultJokes = <JokeModel>[];
    for (final j in List.generate(3, (_) => generateJokeModel())) {
      final joke = await j;
      if (joke != null) {
        resultJokes.add(joke);
      }
    }
    return resultJokes.map((e) => JokeCard(model: e)).toList();
  }
}
