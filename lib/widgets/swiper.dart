import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/joke_card.dart';
import 'package:flutter_application_1/screens/search_screen.dart';
import 'package:flutter_application_1/view_controllers/jokes_view_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

import '../screens/favourites_screen.dart';
import '../styles/color_styles.dart';
import '../styles/text_styles.dart';

class Swiper extends ConsumerWidget {
  const Swiper({super.key, required this.con});

  final JokesViewController con;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<JokeCard> cards = ref.watch(con.provider);

    return Column(
      mainAxisSize: MainAxisSize.max,
      verticalDirection: VerticalDirection.up,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
          child: Row(
            children: [
              OutlinedButton(
                  onPressed: con.swipeDislike,
                  style: OutlinedButton.styleFrom(
                      foregroundColor: LocalColorStyles.red.value,
                      textStyle: LocalTextStyles.button
                          .stylize(LocalColorStyles.red.value)),
                  child: Text("dislike".i18n())),
              OutlinedButton(
                  onPressed: con.swipeLike,
                  style: OutlinedButton.styleFrom(
                      foregroundColor: LocalColorStyles.accent.value,
                      textStyle: LocalTextStyles.button
                          .stylize(LocalColorStyles.accent.value)),
                  child: Text("like".i18n())),
            ]
                .map((e) => Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: e,
                    )))
                .toList(),
          ),
        ),
        Expanded(
          child: AppinioSwiper(
              controller: con.controller, cards: cards, onSwipe: con.onSwipe),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          useSafeArea: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0))),
                          builder: (context) => ProviderScope(
                                child: SearchScreen(),
                              ));
                    },
                    child: Text(
                      "search".i18n(),
                      style: LocalTextStyles.button
                          .stylize(LocalColorStyles.accent.value),
                    )),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ConfettiWidget(
                        minBlastForce: 15,
                        confettiController: con.confettiController,
                        blastDirectionality: BlastDirectionality.explosive),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              useSafeArea: true,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0))),
                              builder: (context) => FavouritesScreen(
                                    storage: con.storage,
                                  ));
                        },
                        child: Text(
                          "favourites".i18n(),
                          style: LocalTextStyles.button
                              .stylize(LocalColorStyles.accent.value),
                        ))
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
