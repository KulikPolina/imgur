import 'package:domain/domain.dart';

sealed class ImagesState {}

class ImagesLoadingState extends ImagesState {}

class ImagesLoadedState extends ImagesState {
  final GalleryModel gallery;

  ImagesLoadedState({
    required this.gallery,
  });
}

class ImagesLoadingErrorState extends ImagesState {}
