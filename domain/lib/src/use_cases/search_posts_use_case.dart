import '../../domain.dart';
import 'use_case.dart';

class SearchPostsUseCase
    implements FutureUseCase<SearchPostsPayload, GalleryModel> {
  final RemoteGalleryRepository _remoteGalleryRepository;
  final LocalHistoryRepository _localHistoryRepository;

  const SearchPostsUseCase(
    this._remoteGalleryRepository,
    this._localHistoryRepository,
  );

  @override
  Future<GalleryModel> execute(SearchPostsPayload input)async  {
    final GalleryModel posts = await _remoteGalleryRepository.searchPosts(payload: input);
    await _localHistoryRepository.saveRequest(payload: input);
    return posts;
  }
}
