import 'package:domain/domain.dart';

import '../entities/entities.dart';
import '../mappers/mappers.dart';
import '../providers/providers.dart';

class RemoteGalleryRepositoryImpl implements RemoteGalleryRepository {
  final ImgurProvider _imgurProvider;

  const RemoteGalleryRepositoryImpl(this._imgurProvider);

  @override
  Future<GalleryModel> getPosts({required GetPostsPayload payload}) async {
    final GalleryEntity result = await _imgurProvider.gallery(
      payload.sectionEnum.name,
      payload.sortEnum.name,
      payload.windowEnum.name,
      payload.page,
    );
    return GalleryMapper.fromEntity(result);
  }

  @override
  Future<PostModel> getDetails({required GetDetailsPayload payload}) async {
    final DetailsEntity result = await _imgurProvider.details(payload.id);
    return PostMapper.fromEntity(result.post);
  }

  @override
  Future<GalleryModel> searchPosts({
    required SearchPostsPayload payload,
  }) async {
    final GalleryEntity result = await _imgurProvider.search(
      payload.query,
      payload.sortEnum.name,
      payload.windowEnum.name,
      payload.page,
    );
    return GalleryMapper.fromEntity(result);
  }
}
