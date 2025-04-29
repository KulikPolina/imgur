import 'package:json_annotation/json_annotation.dart';

part 'image_entity.g.dart';

@JsonSerializable()
class ImageEntity {
  final String id;
  final String? title;
  final String? description;
  final int datetime;
  final String link;
  final String type;

  const ImageEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.datetime,
    required this.link,
    required this.type,
  });

  factory ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ImageEntityToJson(this);
}
