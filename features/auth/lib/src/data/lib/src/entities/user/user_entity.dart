import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

// TODO(): Modify to fit your User entity

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({required String login}) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) => _$UserEntityFromJson(json);
}
