import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/search_images_cubit.dart';

class SearchImagesLoaded extends StatelessWidget {
  final HistoryModel suggestions;
  final GalleryModel searchedGallery;

  const SearchImagesLoaded({
    required this.suggestions,
    required this.searchedGallery,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: AppDimens.PADDING_20),
          child: SuggestionSearchBar(
            suggestions: suggestions.queries,
            leading: IconButton(
              onPressed: context.back,
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            onQueryChanged: context.read<SearchImagesCubit>().search,
            onSuggestionDelete:
                context.read<SearchImagesCubit>().removeSearchQuery,
            onSuggestionTap: context.read<SearchImagesCubit>().search,
          ),
        ),
        Expanded(
          child: PostsGrid(posts: searchedGallery.posts),
        ),
      ],
    );
  }
}
