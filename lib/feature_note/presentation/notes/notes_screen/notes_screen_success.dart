import 'package:flutter/widgets.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/note_order.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/note_item.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/order_section.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state_holder.dart';

class NotesScreenSuccess extends StatelessWidget {
  const NotesScreenSuccess({
    super.key,
    required this.state,
    required this.deleteNote,
    required this.orderNotes,
    required this.addEditNote,
  });

  final NotesStateHolder state;
  final void Function(Note) deleteNote;
  final void Function(NoteOrder) orderNotes;
  final void Function(int) addEditNote;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderSection(
          isVisible: state.isOrderSectionVisible,
          noteOrder: state.noteOrder,
          onOrderChange: orderNotes,
        ),

        SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              runSpacing: 16,
              children: [
                ...state.notes.map(
                  (note) => NoteItem(
                    note: note,
                    onTap: () => addEditNote(note.id),
                    onDelete: () => deleteNote(note),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
