import '../../domain.dart';
import 'use_case.dart';

class ListenFavouritesUseCase implements StreamUseCase<List<PostModel>, void> {
  final LocalFavouritesRepository _localFavouritesRepository;

  const ListenFavouritesUseCase(this._localFavouritesRepository);

  @override
  Stream<List<PostModel>> execute([void input]) {
    return _localFavouritesRepository.favouritesStream.map(
      (List<PostModel> favourites) {
        favourites.sort(
          (PostModel a, PostModel b) => b.datetime.compareTo(a.datetime),
        );

        return favourites;
      },
    );
  }
}
