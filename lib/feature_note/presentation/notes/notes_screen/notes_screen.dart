import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_screen.dart';
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

  void _addEditNote(BuildContext context, {int noteId = -1}) {
    log("Si entrooo");
    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddEditNoteScreen(noteId: noteId),
      ),
    );
  }

  void _deleteNote(BuildContext context, Note note, NoteViewModel viewmodel) {
    viewmodel.onEvent(EventDeleteNote(note));

    final theme = Theme.of(context);
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: "Undo",
        textColor: theme.colorScheme.onSurface,
        backgroundColor: theme.colorScheme.surface,
        onPressed: () => viewmodel.onEvent(EventRestoreNote()),
      ),
      content: Text(
        "Note deleted",
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NotesState state = ref.watch(noteVMProvider);
    final viewmodel = ref.read(noteVMProvider.notifier);

    return SafeScope(
      floatingButton: GoToAddEditNote(callback: () => _addEditNote(context)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NoteScreenHeader(),
            switch (state) {
              NotesStateSuccess() => NotesScreenSuccess(
                state: state.state,
                deleteNote: (note) => _deleteNote(context, note, viewmodel),
                orderNotes:
                    (noteOrder) => viewmodel.onEvent(EventOrder(noteOrder)),
                addEditNote: (noteId) => _addEditNote(context, noteId: noteId),
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
