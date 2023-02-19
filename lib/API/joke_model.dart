import 'package:json_annotation/json_annotation.dart';

part 'joke_model.g.dart';

@JsonSerializable()
class JokeModel {
  final List<String> categories;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'icon_url')
  final String iconUrl;

  final String id;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  final String url;

  final String value;

  JokeModel(this.value, this.url, this.categories, this.createdAt, this.iconUrl,
      this.id, this.updatedAt);

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$JokeModelFromJson(json);
  Map<String, dynamic> toJson() => _$JokeModelToJson(this);
}
