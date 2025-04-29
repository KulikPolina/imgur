import '../models/models.dart';
import '../payloads/payloads.dart';
import '../repositories/repositories.dart';
import 'use_case.dart';

class GetDetailsUseCase implements FutureUseCase<GetDetailsPayload, PostModel> {
  final RemoteGalleryRepository _remoteGalleryRepository;
  final LocalFavouritesRepository _localFavouritesRepository;

  const GetDetailsUseCase(
    this._remoteGalleryRepository,
    this._localFavouritesRepository,
  );

  @override
  Future<PostModel> execute(GetDetailsPayload input) async {
    final PostModel post = await _remoteGalleryRepository.getDetails(payload: input);
    final bool isFavourite = await _localFavouritesRepository.isFavourite(
      favouriteId: input.id,
    );

    return post.copyWith(isFavourite: isFavourite);
  }
}
