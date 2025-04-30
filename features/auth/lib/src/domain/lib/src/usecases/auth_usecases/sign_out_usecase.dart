import '../../repositories/repositories.dart';
import '../export_usecases.dart';

class SignOutUseCase implements FutureUseCase<NoParams, NoParams> {
  final AuthorizationRepository _authRepository;

  SignOutUseCase({
    required AuthorizationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<NoParams> execute(NoParams input) async {
    await _authRepository.signOut();
    return const NoParams();
  }
}
