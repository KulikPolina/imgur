import 'package:auth/src/domain/lib/domain.dart';

import '../entities/entities.dart';
import '../mappers/mappers.dart';
import '../providers/providers.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthorizationProvider _authProvider;

  AuthorizationRepositoryImpl({required authProvider}) : _authProvider = authProvider;

  @override
  Future<UserModel?> signUpWithCredentials({
    required SignUpPayloadModel signUpPayloadModel,
  }) async {
    final UserEntity? userEntity = await _authProvider.signUpWithCredentials(
      signUpPayloadEntity: SignUpPayloadMapper.toEntity(signUpPayloadModel),
    );

    return UserMapper.fromEntity(userEntity);
  }

  @override
  Future<UserModel?> signInWithCredentials({
    required SignInPayloadModel signInPayloadModel,
  }) async {
    final UserEntity? userEntity = await _authProvider.signInWithCredentials(
      signInPayloadEntity: SignInPayloadMapper.toEntity(signInPayloadModel),
    );

    return UserMapper.fromEntity(userEntity);
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final UserEntity? userEntity = await _authProvider.getCurrentUser();

    return UserMapper.fromEntity(userEntity);
  }

  @override
  Future<UserModel?> signInWithSessionId() async {
    final UserEntity? userEntity = await _authProvider.signInWithSessionId();

    return UserMapper.fromEntity(userEntity);
  }

  @override
  Future<void> signOut() async => await _authProvider.signOut();
}
