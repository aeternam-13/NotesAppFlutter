import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/go_to_add_edit_note.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/note_item.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/note_screen_header.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/order_section.dart';
import 'package:notesappflutter/feature_note/presentation/safe_scope.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_event.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  void _addEditNote(BuildContext context, {int noteId = -1}) {
    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddEditNoteScreen(noteId: noteId),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NotesState state = ref.watch(noteVMProvider);
    final viewmodel = ref.read(noteVMProvider.notifier);

    return SafeScope(
      floatingButton: GoToAddEditNote(callback: () => _addEditNote(context)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            NoteScreenHeader(),
            OrderSection(
              isVisible: state.isOrderSectionVisible,
              noteOrder: state.noteOrder,
              onOrderChange:
                  (noteOrder) => viewmodel.onEvent(EventOrder(noteOrder)),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    ...state.notes.map(
                      (note) => NoteItem(
                        note: note,
                        onTap: () => _addEditNote(context, noteId: note.id),
                        onDelete:
                            () => viewmodel.onEvent(EventDeleteNote(note)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
