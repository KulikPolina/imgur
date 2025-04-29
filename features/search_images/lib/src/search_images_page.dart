import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';

import 'bloc/search_images_cubit.dart';
import 'widget/search_images_body.dart';

@RoutePage()
class SearchImagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchImagesCubit>(
      create: (_) => SearchImagesCubit(
        appLocator.get(),
        appLocator.get(),
        appLocator.get(),
        appLocator.get(),
      ),
      child: const SearchImagesBody(),
    );
  }
}
