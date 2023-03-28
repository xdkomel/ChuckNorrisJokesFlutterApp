import 'package:flutter/cupertino.dart';
import 'package:localization/localization.dart';

import '../API/api.dart';
import '../api/search_results_model.dart';

class Tuple<T1, T2> {
  final T1 item1;
  final T2 item2;

  Tuple({
    required this.item1,
    required this.item2,
  });
}

class SearchScreenController {
  final TextEditingController textEditingController = TextEditingController();

  void unfocus(_) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<Tuple<SearchResultsModel?, String?>> search(String query) async {
    if (query.length < 3) {
      return Tuple(item1: null, item2: "short-text-error".i18n());
    }
    final newData = await API.search(textEditingController.text);
    if (newData == null) {
      return Tuple(item1: null, item2: "check-internet-connection".i18n());
    }
    return Tuple(item1: newData, item2: null);
  }
}
