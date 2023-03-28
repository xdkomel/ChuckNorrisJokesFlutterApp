// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultsModel _$SearchResultsModelFromJson(Map<String, dynamic> json) =>
    SearchResultsModel(
      json['total'] as int,
      (json['result'] as List<dynamic>)
          .map((e) => JokeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResultsModelToJson(SearchResultsModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'result': instance.result,
    };
