import 'package:flutter/foundation.dart';

import '../../domain.dart';
import '../mappers/favourites_mapper.dart';
import 'use_case.dart';

class LoadPostsUseCase implements FutureUseCase<GetPostsPayload, GalleryModel> {
  final RemoteGalleryRepository _remoteGalleryRepository;
  final LocalFavouritesRepository _localFavouritesRepository;

  const LoadPostsUseCase(
    this._remoteGalleryRepository,
    this._localFavouritesRepository,
  );

  @override
  Future<GalleryModel> execute(GetPostsPayload input) async {
    final GalleryModel result =
        await _remoteGalleryRepository.getPosts(payload: input);

    final List<PostModel> favourites =
        await _localFavouritesRepository.getFavourites();

    final List<PostModel> posts = await compute(
        FavouritesMapper.map,
        FavouritesMapperArguments(
          result.posts,
          favourites,
        ));

    return GalleryModel(posts: posts);
  }
}
