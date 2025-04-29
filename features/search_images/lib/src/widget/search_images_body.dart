import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/search_images_cubit.dart';
import '../bloc/search_images_state.dart';
import 'search_images_loaded.dart';

class SearchImagesBody extends StatelessWidget {
  const SearchImagesBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
          child: BlocBuilder<SearchImagesCubit, SearchImagesState>(
            builder: (BuildContext context, SearchImagesState state) {
              return switch (state) {
                SearchImagesLoadingState() => const SizedBox.shrink(),
                SearchImagesLoadedState() => SearchImagesLoaded(
                    suggestions: state.suggestions,
                    searchedGallery: state.searchedGallery,
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
