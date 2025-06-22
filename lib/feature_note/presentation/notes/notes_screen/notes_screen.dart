import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/go_to_add_edit_note.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/note_screen_header.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_screen/notes_screen_loading.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_screen/notes_screen_success.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_viewmodel.dart';
import 'package:notesappflutter/feature_note/presentation/safe_scope.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_event.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  void _addEditNote({int noteId = -1}) {
    if (!mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddEditNoteScreen(noteId: noteId),
      ),
    );
  }

  void _onUiEvent(NotesScreenUiEvent event, NoteViewModel viewmodel) {
    switch (event) {
      case ShowSnackBarWithUndo():
        final theme = Theme.of(context);
        final snackBar = SnackBar(
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: "Undo",
            textColor: theme.colorScheme.onSurface,
            backgroundColor: theme.colorScheme.surface,
            onPressed: event.undoCallback,
          ),
          content: Text(
            event.message,
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
  }

  @override
  Widget build(BuildContext context) {
    NotesState state = ref.watch(noteVMProvider);
    final viewmodel = ref.read(noteVMProvider.notifier);
    ref.listen<AsyncValue<NotesScreenUiEvent>>(notesScreenUiEventProvider, (
      prev,
      next,
    ) {
      next.whenData((event) => _onUiEvent(event, viewmodel));
    });
    return SafeScope(
      floatingButton: GoToAddEditNote(callback: () => _addEditNote()),
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
                addEditNote: (noteId) => _addEditNote(noteId: noteId),
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
