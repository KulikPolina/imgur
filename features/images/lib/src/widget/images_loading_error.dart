import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/images_cubit.dart';

class ImagesLoadingError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Error(tryAgain: context.read<ImagesCubit>().tryAgain);
  }
}
