import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/image_details_cubit.dart';
import '../bloc/image_details_state.dart';
import 'image_details_loaded.dart';
import 'image_details_loading.dart';

class ImageDetailsBody extends StatelessWidget {
  const ImageDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageDetailsCubit, ImageDetailsState>(
      builder: (_, ImageDetailsState state) {
        return Scaffold(
          appBar: state is ImageDetailsLoadedState
              ? AppBar(
                  title: Text(state.post.title),
                  actions: <Widget>[
                    IconButton(
                      onPressed: context
                          .read<ImageDetailsCubit>()
                          .switchFavouriteStatus,
                      icon: state.post.isFavourite
                          ? Icon(
                              Icons.favorite,
                              color: AppColors.of(context).favouriteColor,
                            )
                          : const Icon(Icons.favorite_border),
                    ),
                  ],
                )
              : null,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.PADDING_12,
                vertical: AppDimens.PADDING_10,
              ),
              child: switch (state) {
                ImageDetailsLoadingState() => ImageDetailsLoading(),
                ImageDetailsLoadedState() =>
                  ImageDetailsLoaded(post: state.post),
              },
            ),
          ),
        );
      },
    );
  }
}
