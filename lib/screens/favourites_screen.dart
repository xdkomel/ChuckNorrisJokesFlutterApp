import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/local_storage.dart';
import 'package:flutter_application_1/styles/color_styles.dart';
import 'package:flutter_application_1/styles/text_styles.dart';
import 'package:localization/localization.dart';

import '../api/joke_model.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key, required this.storage}) {
    _jokes = storage.get();
  }

  final LocalStorage storage;
  late final List<JokeModel>? _jokes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "close".i18n(),
                style: LocalTextStyles.button
                    .stylize(LocalColorStyles.accent.value),
              )),
          (_jokes == null || _jokes!.isEmpty
              ? Expanded(
                  child: Center(
                    child: Text(
                      "no-favourites".i18n(),
                      textAlign: TextAlign.center,
                      style: LocalTextStyles.heading
                          .stylize(LocalColorStyles.darkGray.value),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            _jokes![_jokes!.length - index - 1].value,
                            style: LocalTextStyles.body
                                .stylize(LocalColorStyles.darkGray.value),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(height: 1),
                      itemCount: _jokes!.length),
                ))
        ],
      ),
    );
  }
}
