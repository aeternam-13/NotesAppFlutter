import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NotesState notes = ref.watch(noteVMProvider);
    final viewmodel = ref.read(noteVMProvider.notifier);
    return Scaffold(
      floatingActionButton: AddEditNoteButton(
        callback:
            () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditNoteScreen()),
            ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Notes App Flutter",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(notes.toString()),
              ElevatedButton(onPressed: () async {}, child: Text("Add note")),
            ],
          ),
        ),
      ),
    );
  }
}

class AddEditNoteButton extends StatelessWidget {
  const AddEditNoteButton({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FloatingActionButton(
      onPressed: callback,

      backgroundColor: theme.colorScheme.primary,
      child: Icon(Icons.add, color: Colors.white),
    );
  }
}
