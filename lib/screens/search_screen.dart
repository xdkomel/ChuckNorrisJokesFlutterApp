import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/search_results_model.dart';
import 'package:flutter_application_1/widgets/search_results_list.dart';
import 'package:localization/localization.dart';

import '../API/api.dart';
import '../styles/color_styles.dart';
import '../styles/text_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController textEditingController = TextEditingController();
  String? errorMessage;
  SearchResultsModel? results;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextField(
                  controller: textEditingController,
                  autofocus: true,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "search-hint".i18n()),
                  onTapOutside: (_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onEditingComplete: () async {
                    if (textEditingController.text.length < 3) {
                      setState(() {
                        errorMessage = "short-text-error".i18n();
                      });
                    } else {
                      final newData =
                          await API.search(textEditingController.text);
                      if (newData == null) {
                        setState(() {
                          errorMessage = "check-internet-connection".i18n();
                        });
                      } else {
                        setState(() {
                          results = newData;
                          errorMessage = null;
                        });
                      }
                    }
                  }),
            ),
            SearchResultsList(
              searchResults: results,
              errorMessage: errorMessage,
            )
          ],
        ));
  }
}
