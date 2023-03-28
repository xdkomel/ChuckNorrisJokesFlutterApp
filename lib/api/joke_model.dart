import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class JokeModel extends HiveObject {
  @HiveField(0)
  final List<String> categories;

  @HiveField(1)
  @JsonKey(name: 'created_at')
  final String createdAt;

  @HiveField(2)
  @JsonKey(name: 'icon_url')
  final String iconUrl;

  @HiveField(3)
  final String id;

  @HiveField(4)
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @HiveField(5)
  final String url;

  @HiveField(6)
  final String value;

  JokeModel(this.categories, this.createdAt, this.iconUrl, this.id,
      this.updatedAt, this.url, this.value);

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$JokeModelFromJson(json);
  Map<String, dynamic> toJson() => _$JokeModelToJson(this);
}
