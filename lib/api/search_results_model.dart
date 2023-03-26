import 'package:flutter_application_1/api/joke_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_results_model.g.dart';

@JsonSerializable()
class SearchResultsModel {
  final String total;

  final List<JokeModel> results;

  SearchResultsModel(this.total, this.results);

  factory SearchResultsModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultsModelToJson(this);
}
