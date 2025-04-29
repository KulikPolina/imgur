import 'package:json_annotation/json_annotation.dart';

import 'image_entity.dart';

part 'post_entity.g.dart';

@JsonSerializable()
class PostEntity {
  final String id;
  final String title;
  final String? description;
  final int datetime;
  final List<ImageEntity>? images;

  const PostEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.datetime,
    required this.images,
  });

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PostEntityToJson(this);
}
