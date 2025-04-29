import '../../domain.dart';

class FavouritesMapperArguments {
  final List<PostModel> _images;
  final List<PostModel> _favouritesImages;

  FavouritesMapperArguments(this._images, this._favouritesImages);

  List<PostModel> get images => _images;

  List<PostModel> get favouritesImages => _favouritesImages;
}

class FavouritesMapper {
  static List<PostModel> map(FavouritesMapperArguments args) {
    final List<String> favouritesImagesIds =
        args.favouritesImages.map((PostModel post) => post.id).toList();

    return args.images
        .where((PostModel post) => post.images.isNotEmpty)
        .map(
          (PostModel post) => favouritesImagesIds.contains(post.id)
              ? post.copyWith(isFavourite: true)
              : post,
        )
        .toList();
  }
}
