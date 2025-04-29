import '../models/models.dart';
import '../payloads/payloads.dart';

abstract interface class RemoteGalleryRepository {
  Future<GalleryModel> getPosts({
    required GetPostsPayload payload,
  });

  Future<PostModel> getDetails({
    required GetDetailsPayload payload,
  });

  Future<GalleryModel> searchPosts({
    required SearchPostsPayload payload,
  });
}
