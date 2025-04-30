import 'package:auth/src/domain/lib/domain.dart';


import '../entities/entities.dart';

class UserMapper {
  static UserModel? fromEntity(UserEntity? entity) {
    if (entity == null) {
      return null;
    }

    return UserModel(login: entity.login);
  }

  static UserEntity? toEntity(UserModel? model) {
    if (model == null) {
      return null;
    }

    return UserEntity(login: model.login);
  }

}
