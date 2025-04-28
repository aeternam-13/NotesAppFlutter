import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_screen.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Note> notes = ref.watch(noteVMProvider);
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
              ElevatedButton(
                onPressed: () async {
                  await viewmodel.insertNote(
                    Note(
                      title: "asddsa",
                      content: "cacotas",
                      timestamp: 5000,
                      color: 0xFF6AE78C,
                      id: DateTime.timestamp().millisecond,
                    ),
                  );
                },
                child: Text("Add note"),
              ),
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
