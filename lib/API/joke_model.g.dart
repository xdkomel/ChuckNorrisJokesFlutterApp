// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeModel _$JokeModelFromJson(Map<String, dynamic> json) => JokeModel(
      json['value'] as String,
      json['url'] as String,
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      json['created_at'] as String,
      json['icon_url'] as String,
      json['id'] as String,
      json['updated_at'] as String,
    );

Map<String, dynamic> _$JokeModelToJson(JokeModel instance) => <String, dynamic>{
      'categories': instance.categories,
      'created_at': instance.createdAt,
      'icon_url': instance.iconUrl,
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'url': instance.url,
      'value': instance.value,
    };
