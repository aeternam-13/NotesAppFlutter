import 'package:flutter/material.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';

class NotesScreenError extends StatelessWidget {
  const NotesScreenError({super.key, required this.exception});

  final NoteException exception;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Text(exception.message),
        Icon(Icons.error_outline_outlined, color: Colors.red),
      ],
    );
  }
}
