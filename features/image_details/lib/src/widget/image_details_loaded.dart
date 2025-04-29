import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ImageDetailsLoaded extends StatelessWidget {
  final PostModel post;

  const ImageDetailsLoaded({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime date =
        DateTime.fromMillisecondsSinceEpoch(1000 * post.datetime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(DateFormat.yMd().add_jm().format(date)),
        const SizedBox(height: AppDimens.PADDING_16),
        for (final ImageModel image in post.images) ...<Widget>[
          ImageCard(
            child: Column(
              children: <Widget>[
                CachedNetworkImage(
                  fadeInDuration: Duration.zero,
                  fadeOutDuration: Duration.zero,
                  fit: BoxFit.fitWidth,
                  imageUrl: image.link,
                  placeholder: (_, __) => Shimmer(),
                ),
                if (image.description?.isNotEmpty ?? false) ...<Widget>[
                  const SizedBox(height: AppDimens.PADDING_10),
                  Text(image.description ?? ''),
                ],
              ],
            ),
          ),
          const SizedBox(height: AppDimens.PADDING_16),
        ],
      ],
    );
  }
}
