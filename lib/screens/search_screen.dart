import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/search_results_model.dart';
import 'package:flutter_application_1/view_controllers/search_screen_controller.dart';
import 'package:flutter_application_1/widgets/search_results_list.dart';
import 'package:localization/localization.dart';

import '../styles/color_styles.dart';
import '../styles/text_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = SearchScreenController();
  String? errorMessage;
  SearchResultsModel? results;

  @override
  void dispose() {
    controller.textEditingController.dispose();
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
                  controller: controller.textEditingController,
                  autofocus: true,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "search-hint".i18n()),
                  onTapOutside: controller.unfocus,
                  onEditingComplete: () async {
                    final searchResults = await controller
                        .search(controller.textEditingController.text);
                    setState(() {
                      results = searchResults.item1;
                      errorMessage = searchResults.item2;
                    });
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
