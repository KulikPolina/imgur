import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/favourites_cubit.dart';

class FavouritesLoaded extends StatelessWidget {
  final List<PostModel> favourites;

  const FavouritesLoaded({
    required this.favourites,
  });

  @override
  Widget build(BuildContext context) {
    return PostsGrid(
      posts: favourites,
      onPostTap: (PostModel post) =>
          context.read<FavouritesCubit>().goToImageDetails(post.id),
    );
  }
}
