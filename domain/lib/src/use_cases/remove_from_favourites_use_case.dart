import '../repositories/repositories.dart';
import 'use_case.dart';

class RemoveFromFavouritesUseCase implements FutureUseCase<String, void> {
  final LocalFavouritesRepository _localFavouritesRepository;

  const RemoveFromFavouritesUseCase(this._localFavouritesRepository);

  @override
  Future<void> execute(String input) {
    return _localFavouritesRepository.removeFromFavourite(favouriteId: input);
  }
}
