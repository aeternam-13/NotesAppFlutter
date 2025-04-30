import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/order_section.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_event.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NotesState state = ref.watch(noteVMProvider);
    final viewmodel = ref.read(noteVMProvider.notifier);
    final theme = Theme.of(context);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "NotesApp Flutter",
                    style: theme.textTheme.headlineLarge,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: theme.primaryColor,
                      size: 32,
                    ),
                  ),
                ],
              ),
              OrderSection(
                noteOrder: state.noteOrder,
                onOrderChange:
                    (noteOrder) =>
                        viewmodel.onEvent(NotesEventOrder(noteOrder)),
              ),
              Text(state.notes.toString()),
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
