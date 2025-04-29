import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

import 'search_images_state.dart';

class SearchImagesCubit extends Cubit<SearchImagesState>
    with PaginationMixin<SearchImagesState> {
  final SearchPostsUseCase _searchPostsUseCase;
  final GetSearchHistoryUseCase _getSearchHistoryUseCase;
  final GetSuggestionsUseCase _getSuggestionsUseCase;
  final RemoveSearchHistoryUseCase _removeSearchHistoryUseCase;

  SearchImagesCubit(
    this._searchPostsUseCase,
    this._getSearchHistoryUseCase,
    this._getSuggestionsUseCase,
    this._removeSearchHistoryUseCase,
  ) : super(SearchImagesLoadingState()) {
    _init();
  }

  final Debouncer _debouncer = Debouncer();

  Future<void> _init() async {
    final HistoryModel suggestions = await _getSearchHistoryUseCase.execute();

    emit(
      SearchImagesLoadedState(
        suggestions: suggestions,
        searchedGallery: GalleryModel.empty(),
      ),
    );
  }

  Future<void> _startSearch(String query) async {
    final GalleryModel searchedGallery = query.isNotEmpty
        ? await _searchPostsUseCase.execute(SearchPostsPayload(query: query))
        : GalleryModel.empty();

    final HistoryModel suggestion = query.isNotEmpty
        ? await _getSuggestionsUseCase.execute(query)
        : await _getSearchHistoryUseCase.execute();

    emit(
      SearchImagesLoadedState(
        suggestions: suggestion,
        searchedGallery: searchedGallery,
      ),
    );
  }

  Future<void> search(String query) async {
    _debouncer.debounce(
      duration: AppDimens.debounceDuration,
      onDebounce: () async {
        unawaited(_startSearch(query));
      },
    );
  }

  Future<void> removeSearchQuery(String query) async {
    final SearchImagesState state = this.state;
    if (state is! SearchImagesLoadedState) return;

    final List<String> suggestionQueries = state.suggestions.queries
        .where((String suggestion) => suggestion != query)
        .toList();

    await _removeSearchHistoryUseCase.execute(query);

    emit(
      state.copyWith(
        suggestions: HistoryModel(queries: suggestionQueries),
      ),
    );
  }
}
