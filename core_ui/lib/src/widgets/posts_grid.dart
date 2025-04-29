import 'dart:math';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';

class PostsGrid extends StatelessWidget {
  final List<PostModel> posts;
  final ScrollController? controller;

  final ValueChanged<PostModel>? onPostTap;

  const PostsGrid({
    required this.posts,
    this.controller,
    this.onPostTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Grid(
      controller: controller,
      itemCount: posts.length,
      builder: (BuildContext context, int index) {
        final PostModel post = posts[index];

        return Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimens.PADDING_10,
                right: AppDimens.PADDING_10,
              ),
              child: GestureDetector(
                onTap: () => onPostTap?.call(post),
                child: ImageCard(
                  child: CachedNetworkImage(
                    fadeInDuration: Duration.zero,
                    fadeOutDuration: Duration.zero,
                    fit: BoxFit.fitWidth,
                    imageUrl: post.images.first.link,
                    placeholder: (_, __) => Shimmer(),
                  ),
                ),
              ),
            ),
            if (post.isFavourite)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppColors.of(context).shadowColor,
                      offset: const Offset(
                        AppDimens.OFFSET_0,
                        AppDimens.OFFSET_4,
                      ),
                      blurRadius: AppDimens.RADIUS_8,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.PADDING_10),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.of(context).favouriteColor,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
