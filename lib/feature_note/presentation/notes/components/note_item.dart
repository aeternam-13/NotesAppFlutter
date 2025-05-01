import 'package:flutter/material.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note, required this.onDelete});
  final Note note;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        spacing: 15,
        children: [
          Text(note.title),
          Text(note.content),
          IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
        ],
      ),
    );
  }
}
