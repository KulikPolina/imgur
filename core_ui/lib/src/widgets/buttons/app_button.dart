import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AppButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }


}