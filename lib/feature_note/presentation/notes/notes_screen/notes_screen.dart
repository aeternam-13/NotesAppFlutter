import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:notesappflutter/feature_note/presentation/common_components/snackbar_undo.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/go_to_add_edit_note.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/note_screen_header.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_screen/notes_screen_loading.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_screen/notes_screen_success.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_viewmodel.dart';
import 'package:notesappflutter/feature_note/presentation/safe_scope.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_event.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  void _onUiEvent(BuildContext context, NotesScreenUiEvent event) {
    if (!context.mounted) return;
    switch (event) {
      case ShowSnackBarWithUndo():
        showSnackBarWithUndo(context, event.message, event.undoCallback);
      case NavigateToAddEditNote():
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddEditNoteScreen(noteId: event.noteId),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NotesState state = ref.watch(noteVMProvider);
    final viewmodel = ref.read(noteVMProvider.notifier);

    ref.listen<AsyncValue<NotesScreenUiEvent>>(notesScreenUiEventProvider, (
      prev,
      next,
    ) {
      next.whenData((event) => _onUiEvent(context, event));
    });

    return SafeScope(
      floatingButton: GoToAddEditNoteButton(
        callback: () => EventGoToAddEditNote(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NoteScreenHeader(),
            switch (state) {
              NotesStateSuccess() => NotesScreenSuccess(
                state: state.state,
                deleteNote: (note) => viewmodel.onEvent(EventDeleteNote(note)),
                orderNotes:
                    (noteOrder) => viewmodel.onEvent(EventOrder(noteOrder)),
                addEditNote: (noteId) => EventGoToAddEditNote(noteId: noteId),
              ),

              NotesStateError() => throw UnimplementedError(),

              NotesStateLoading() => NotesScreenLoading(),
            },
          ],
        ),
      ),
    );
  }
}
