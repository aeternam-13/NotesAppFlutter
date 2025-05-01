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
      child: Container(
        constraints: BoxConstraints(
          minWidth: 200,
          maxWidth: 450,
          minHeight: 100,
        ),
        color: Color(note.color),
        padding: EdgeInsets.all(6),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              note.title,
              style: InmutableStyle.titleLargeLargeBlack(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    note.content,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: InmutableStyle.bodyLargeBlack(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: InkWell(onTap: onDelete, child: Icon(Icons.delete)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
