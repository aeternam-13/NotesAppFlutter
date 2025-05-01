import 'package:flutter/material.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/presentation/common_components/inmutable_text.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onTap,
  });

  final Note note;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Color(note.color),
        child: Column(
          spacing: 15,
          children: [
            Text(
              note.title,
              style: InmutableStyle.titleLargeLargeBlack(context),
            ),
            Text(note.content, style: InmutableStyle.bodyLargeBlack(context)),
            IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}
