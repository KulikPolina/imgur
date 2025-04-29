import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';

class Error extends StatelessWidget {
  final String? error;
  final VoidCallback tryAgain;

  const Error({super.key, required this.tryAgain, this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error ?? context.tr('error.generic'),
          ),
          const SizedBox(
            height: AppDimens.PADDING_10,
          ),
          AppButton(
            title: context.tr('error.try_again'),
            onPressed: tryAgain,
          ),
        ],
      ),
    );
  }
}
