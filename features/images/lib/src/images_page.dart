import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';

import 'bloc/images_cubit.dart';
import 'widget/images_body.dart';

@RoutePage()
class ImagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImagesCubit>(
      create: (_) => ImagesCubit(
        appLocator.get(),
        appLocator.get(),
        appLocator.get(),
      ),
      child: const ImagesBody(),
    );
  }
}
