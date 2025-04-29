import 'post_model.dart';

class GalleryModel {
  final List<PostModel> posts;

  const GalleryModel({
    required this.posts,
  });

  GalleryModel.empty() : this(posts: <PostModel>[]);

  GalleryModel combine(GalleryModel other) {
    return GalleryModel(
      posts: <PostModel>[
        ...posts,
        ...other.posts,
      ],
    );
  }
}
