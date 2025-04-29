import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> with PaginationMixin<ImagesState> {
  final AppRouter _appRouter;
  final LoadPostsUseCase _loadPostsUseCase;
  final CheckFavouritesUseCase _checkFavouritesUseCase;

  ImagesCubit(
    this._appRouter,
    this._loadPostsUseCase,
    this._checkFavouritesUseCase,
  ) : super(ImagesLoadingState()) {
    init();
  }

  Future<void> goToImageDetails(String id) async {
    await _appRouter.push(
      ImageDetailsRoute(id: id),
    );

    await _updateFavouriteStatus(id: id);
  }

  void tryAgain() {
    emit(ImagesLoadingState());
    init();
  }

  void startSearch() {
    _appRouter.push(const SearchImagesRoute());
  }

  @visibleForTesting
  Future<void> init() async {
    initPagination(onLoad: loadPage);
    await loadPage(0);
  }

  @visibleForTesting
  Future<void> loadPage(int page) async {
    try {
      final GalleryModel pageGallery = await _loadPostsUseCase.execute(
        GetPostsPayload.fromPage(page: page),
      );

      final ImagesState state = this.state;
      final GalleryModel gallery = state is ImagesLoadedState
          ? pageGallery.combine(state.gallery)
          : pageGallery;

      emit(
        ImagesLoadedState(gallery: gallery),
      );
    } catch (_) {
      emit(ImagesLoadingErrorState());
    }
  }

  Future<void> _updateFavouriteStatus({
    required String id,
  }) async {
    final ImagesState state = this.state;
    if (state is! ImagesLoadedState) return;

    final bool isFavourite = await _checkFavouritesUseCase.execute(id);

    final int index = state.gallery.posts.indexWhere(
      (PostModel post) => post.id == id,
    );
    if (state.gallery.posts[index].isFavourite == isFavourite) return;

    final List<PostModel> posts = List<PostModel>.of(state.gallery.posts);
    posts[index] = posts[index].copyWith(isFavourite: isFavourite);

    emit(
      ImagesLoadedState(
        gallery: GalleryModel(posts: posts),
      ),
    );
  }

  @override
  Future<void> close() {
    disposePagination();

    return super.close();
  }
}
