import '../models/models.dart';
import '../repositories/repositories.dart';
import 'use_case.dart';

class AddToFavouritesUseCase implements FutureUseCase<PostModel, void> {
  final LocalFavouritesRepository _localFavouritesRepository;

  const AddToFavouritesUseCase(this._localFavouritesRepository);

  @override
  Future<void> execute(PostModel input) {
    return _localFavouritesRepository.addToFavourite(favourite: input);
  }
}
