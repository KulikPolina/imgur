import 'package:core/core.dart';
import 'package:domain/domain.dart';

sealed class SearchImagesState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class SearchImagesLoadingState extends SearchImagesState {}

class SearchImagesLoadedState extends SearchImagesState {
  final HistoryModel suggestions;
  final GalleryModel searchedGallery;

  SearchImagesLoadedState({
    required this.suggestions,
    required this.searchedGallery,
  });

  SearchImagesLoadedState copyWith({
    HistoryModel? suggestions,
    GalleryModel? searchedGallery,
  }) {
    return SearchImagesLoadedState(
      suggestions: suggestions ?? this.suggestions,
      searchedGallery: searchedGallery ?? this.searchedGallery,
    );
  }

  @override
  List<Object?> get props => <Object?>[suggestions, searchedGallery];
}
