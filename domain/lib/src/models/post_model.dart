import 'image_model.dart';

class PostModel {
  final String id;
  final String title;
  final String? description;
  final int datetime;
  final List<ImageModel> images;

  final bool isFavourite;

  const PostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.datetime,
    required this.images,
    required this.isFavourite,
  });

  PostModel copyWith({
    String? id,
    String? title,
    String? description,
    int? datetime,
    List<ImageModel>? images,
    bool? isFavourite,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      datetime: datetime ?? this.datetime,
      images: images ?? this.images,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
