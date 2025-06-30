import 'package:flutter/material.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';

class NotesScreenError extends StatelessWidget {
  const NotesScreenError({
    super.key,
    required this.exception,
    required this.retry,
  });

  final NoteException exception;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 12,
          children: [
            Text(exception.message, style: theme.textTheme.bodyLarge),
            Icon(Icons.error_outline_outlined, color: Colors.red, size: 46),
            ElevatedButton(onPressed: retry, child: Text("Retry")),
          ],
        ),
      ],
    );
  }
}
