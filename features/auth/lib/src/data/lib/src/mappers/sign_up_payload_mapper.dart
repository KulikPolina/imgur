import 'package:auth/src/domain/lib/domain.dart';

import '../entities/entities.dart';

class SignUpPayloadMapper {
  static SignUpPayloadModel fromEntity(SignUpPayloadEntity entity) {
    return SignUpPayloadModel(
      login: entity.login,
      password: entity.password,
    );
  }

  static SignUpPayloadEntity toEntity(SignUpPayloadModel model) {
    return SignUpPayloadEntity(
      login: model.login,
      password: model.password,
    );
  }
}
