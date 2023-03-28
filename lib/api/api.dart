import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter_application_1/api/joke_model.dart';
import 'package:flutter_application_1/api/search_results_model.dart';

class API {
  static final API _api = API._internal();

  factory API() {
    return _api;
  }

  API._internal();

  static final Dio _dio = Dio();

  static Future<JokeModel?> loadRandom() async {
    try {
      final response =
          await _dio.get('https://api.chucknorris.io/jokes/random');
      final model = JokeModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      developer.log("Could not load random: $e");
    }
    return null;
  }

  static Future<SearchResultsModel?> search(String query) async {
    query = query.trim();
    try {
      final response = await _dio
          .get('https://api.chucknorris.io/jokes/search?query=$query');
      final model = SearchResultsModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      developer.log("Could not search $query: $e");
    }
    return null;
  }
}
