import 'package:flutter/material.dart';

void showSnackBarWithUndo(
  BuildContext context,
  String text,
  VoidCallback callback,
) {
  final theme = Theme.of(context);
  final snackBar = SnackBar(
    duration: Duration(seconds: 3),
    action: SnackBarAction(
      label: "Undo",
      textColor: theme.colorScheme.onSurface,
      backgroundColor: theme.colorScheme.surface,
      onPressed: callback,
    ),
    content: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.surface,
        fontSize: 17,
      ),
    ),
    backgroundColor: theme.colorScheme.primary,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
