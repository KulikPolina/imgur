import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../export_usecases.dart';

class SignInWithCredentialsUseCase implements FutureUseCase<SignInPayloadModel, UserModel?> {
  final AuthorizationRepository _authRepository;

  SignInWithCredentialsUseCase({
    required AuthorizationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel?> execute(SignInPayloadModel input) async {
    return _authRepository.signInWithCredentials(signInPayloadModel: input);
  }
}
