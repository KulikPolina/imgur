import '../entities/entities.dart';

abstract class AuthorizationProvider {
  Future<UserEntity?> signUpWithCredentials({
    required SignUpPayloadEntity signUpPayloadEntity,
  });

  Future<UserEntity?> signInWithCredentials({
    required SignInPayloadEntity signInPayloadEntity,
  });

  Future<UserEntity?> signInWithSessionId();

  Future<void> signOut();

  Future<UserEntity?> getCurrentUser();
}
