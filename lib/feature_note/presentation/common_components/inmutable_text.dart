import 'package:flutter/material.dart';

class InmutableStyle {
  static TextStyle titleLargeLargeBlack(BuildContext context) {
    return Theme.of(
      context,
    ).textTheme.titleLarge!.copyWith(color: Colors.black);
  }

  static TextStyle bodyLargeBlack(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black);
  }
}
