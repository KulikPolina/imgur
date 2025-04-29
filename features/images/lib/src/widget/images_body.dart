import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/images_cubit.dart';
import '../bloc/images_state.dart';
import 'images_loaded.dart';
import 'images_loading.dart';
import 'images_loading_error.dart';

class ImagesBody extends StatefulWidget {
  const ImagesBody();

  @override
  State<ImagesBody> createState() => _ImagesBodyState();
}

class _ImagesBodyState extends State<ImagesBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesCubit, ImagesState>(
      builder: (_, ImagesState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.tr('titles.images')),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              if (state is ImagesLoadedState)
                IconButton(
                  onPressed: context.read<ImagesCubit>().startSearch,
                  icon: const Icon(Icons.search_rounded),
                ),
            ],
          ),
          body: switch (state) {
            ImagesLoadingState() => ImagesLoading(),
            ImagesLoadedState() => ImagesLoaded(gallery: state.gallery),
            ImagesLoadingErrorState() => ImagesLoadingError(),
          },
        );
      },
    );
  }
}
