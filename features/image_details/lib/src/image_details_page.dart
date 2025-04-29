import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';

import 'bloc/image_details_cubit.dart';
import 'widget/image_details_body.dart';

@RoutePage()
class ImageDetailsPage extends StatelessWidget {
  final String id;

  const ImageDetailsPage({
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageDetailsCubit>(
      create: (_) => ImageDetailsCubit(
        appLocator.get(),
        appLocator.get(),
        appLocator.get(),
        id,
      ),
      child: const ImageDetailsBody(),
    );
  }
}
