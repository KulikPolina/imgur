import '../models/models.dart';

abstract class AuthorizationRepository {
  Future<UserModel?> signUpWithCredentials({
    required SignUpPayloadModel signUpPayloadModel,
  });

  Future<UserModel?> signInWithCredentials({
    required SignInPayloadModel signInPayloadModel,
  });

  Future<void> signOut();

  Future<UserModel?> getCurrentUser();
}
