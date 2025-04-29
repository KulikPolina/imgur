import 'package:json_annotation/json_annotation.dart';

import 'post_entity.dart';

part 'details_entity.g.dart';

@JsonSerializable()
class DetailsEntity {
  @JsonKey(name: 'data')
  final PostEntity post;

  const DetailsEntity({
    required this.post,
  });

  factory DetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$DetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsEntityToJson(this);
}
