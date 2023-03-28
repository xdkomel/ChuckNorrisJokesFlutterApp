import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/error_happened.dart';
import 'package:localization/localization.dart';

import '../api/search_results_model.dart';
import '../styles/color_styles.dart';
import '../styles/text_styles.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList(
      {super.key, required this.searchResults, required this.errorMessage});
  final SearchResultsModel? searchResults;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    if (searchResults == null && errorMessage == null) {
      return const SizedBox.shrink();
    } else if (searchResults != null && errorMessage == null) {
      return Expanded(
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  index == 0
                      ? "found-amount".i18n(["${searchResults!.result.length}"])
                      : searchResults!.result[index - 1].value,
                  style: index == 0
                      ? LocalTextStyles.button
                          .stylize(LocalColorStyles.darkGray.value)
                      : LocalTextStyles.body
                          .stylize(LocalColorStyles.darkGray.value),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1),
            itemCount: searchResults!.result.length + 1),
      );
    }
    return ErrorHappened(errorText: errorMessage, updateFun: null);
  }
}
