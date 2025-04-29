import '../repositories/repositories.dart';
import 'use_case.dart';

class CheckFavouritesUseCase implements FutureUseCase<String, bool> {
  final LocalFavouritesRepository _localFavouritesRepository;

  const CheckFavouritesUseCase(this._localFavouritesRepository);

  @override
  Future<bool> execute(String input) {
    return _localFavouritesRepository.isFavourite(favouriteId: input);
  }
}
