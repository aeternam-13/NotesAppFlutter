import 'package:flutter/material.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/data/repository/note_repository_impl.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final repo = NoteRepositoryImpl(NoteDao());
  String _text = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _text = (await repo.getNotes()).toString();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
              Text(_text),
              ElevatedButton(
                onPressed: () async {
                  await repo.insertNote(
                    Note(
                      title: "asddsa",
                      content: "asddsa",
                      timestamp: 5000,
                      color: 0xFF6AE78C,
                      id: 8,
                    ),
                  );

                  _text = (await repo.getNotes()).toString();
                  setState(() {});
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
