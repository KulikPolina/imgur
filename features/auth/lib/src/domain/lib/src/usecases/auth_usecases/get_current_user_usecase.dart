import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../export_usecases.dart';

class GetCurrentUserUsecase implements FutureUseCase<NoParams, UserModel?> {
  final AuthorizationRepository _authRepository;

  GetCurrentUserUsecase({
    required AuthorizationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel?> execute(NoParams input) async {
    return await _authRepository.getCurrentUser();
  }
}
