import 'package:domain/domain.dart';

import '../entities/entities.dart';

class ImageMapper {
  static ImageModel fromEntity(ImageEntity entity) {
    return ImageModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      datetime: entity.datetime,
      link: entity.link,
    );
  }

  static ImageEntity toEntity(ImageModel model) {
    return ImageEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      datetime: model.datetime,
      link: model.link,
      type: 'image',
    );
  }
}
