import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/favourites_cubit.dart';

class FavouritesEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(context.tr('empty.favourites')),
          const SizedBox(
            height: AppDimens.PADDING_10,
          ),
          AppButton(
            title: context.tr(
              'action.go_to_images',
            ),
            onPressed: context.read<FavouritesCubit>().goToImages,
          ),
        ],
      ),
    );
  }
}
