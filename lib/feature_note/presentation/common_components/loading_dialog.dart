import 'package:flutter/material.dart';

void loadingDIalog(BuildContext context, String texto) async {
  final theme = Theme.of(context);
  await showDialog<String>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                  child: Text(
                    texto,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                CircularProgressIndicator(color: theme.colorScheme.primary),
              ],
            ),
          ),
        ),
      );
    },
  );
}
