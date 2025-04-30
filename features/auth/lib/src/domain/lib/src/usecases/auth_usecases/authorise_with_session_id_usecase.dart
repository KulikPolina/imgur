import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../export_usecases.dart';

class SignInWithSessionIdUseCase implements FutureUseCase<NoParams, UserModel?> {
  final AuthorizationRepository _authRepository;

  SignInWithSessionIdUseCase({
    required AuthorizationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel?> execute(NoParams input) async {
    return _authRepository.signInWithSessionId();
  }
}
