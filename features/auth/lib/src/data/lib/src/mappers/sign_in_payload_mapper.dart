import 'package:auth/src/domain/lib/domain.dart';

import '../entities/entities.dart';

class SignInPayloadMapper {
  static SignInPayloadModel fromEntity(SignInPayloadEntity entity) {
    return SignInPayloadModel(
      login: entity.login,
      password: entity.password,
    );
  }

  static SignInPayloadEntity toEntity(SignInPayloadModel model) {
    return SignInPayloadEntity(
      login: model.login,
      password: model.password,
    );
  }
}
