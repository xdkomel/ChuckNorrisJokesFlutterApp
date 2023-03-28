import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Widgets/joke_card.dart';

class JokeCardsNotifier extends StateNotifier<List<JokeCard>> {
  JokeCardsNotifier(super.state);

  void addCard(JokeCard card) {
    state.insert(0, card);
  }

  void addMultipleCards(List<JokeCard> cards) {
    for (final card in cards) {
      addCard(card);
    }
  }

  JokeCard? getLast() {
    if (state.isNotEmpty) {
      return state.last;
    }
    return null;
  }
}
