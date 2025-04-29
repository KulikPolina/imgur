import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'image_details_state.dart';

class ImageDetailsCubit extends Cubit<ImageDetailsState> {
  final GetDetailsUseCase _getDetailsUseCase;
  final AddToFavouritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavouritesUseCase _removeFromFavoritesUseCase;

  ImageDetailsCubit(
    this._getDetailsUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
    String postId,
  ) : super(ImageDetailsLoadingState()) {
    _init(postId);
  }

  Future<void> switchFavouriteStatus() async {
    final ImageDetailsState state = this.state;
    if (state is! ImageDetailsLoadedState) return;

    try {
      if (state.post.isFavourite) {
        await _removeFromFavoritesUseCase.execute(state.post.id);
      } else {
        await _addToFavoritesUseCase.execute(state.post);
      }

      emit(
        ImageDetailsLoadedState(
          post: state.post.copyWith(isFavourite: !state.post.isFavourite),
        ),
      );
    } catch (ex) {
      return;
    }
  }

  Future<void> _init(String postId) async {
    final PostModel post = await _getDetailsUseCase.execute(
      GetDetailsPayload(id: postId),
    );

    emit(
      ImageDetailsLoadedState(post: post),
    );
  }
}
