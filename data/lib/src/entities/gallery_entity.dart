import 'package:json_annotation/json_annotation.dart';

import 'post_entity.dart';

part 'gallery_entity.g.dart';

@JsonSerializable()
class GalleryEntity {
  @JsonKey(name: 'data')
  final List<PostEntity> posts;

  const GalleryEntity({
    required this.posts,
  });

  factory GalleryEntity.fromJson(Map<String, dynamic> json) =>
      _$GalleryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryEntityToJson(this);
}
