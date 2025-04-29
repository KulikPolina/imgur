import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/images_cubit.dart';

class ImagesLoaded extends StatelessWidget {
  final GalleryModel gallery;

  const ImagesLoaded({
    required this.gallery,
  });

  @override
  Widget build(BuildContext context) {
    return PostsGrid(
      controller: context.read<ImagesCubit>().paginationController,
      posts: gallery.posts,
      onPostTap: (PostModel post) =>
          context.read<ImagesCubit>().goToImageDetails(post.id),
    );
  }
}
