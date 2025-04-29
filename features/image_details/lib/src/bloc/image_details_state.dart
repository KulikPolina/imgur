import 'package:domain/domain.dart';

sealed class ImageDetailsState {}

class ImageDetailsLoadingState extends ImageDetailsState {}

class ImageDetailsLoadedState extends ImageDetailsState {
  final PostModel post;

  ImageDetailsLoadedState({
    required this.post,
  });
}
