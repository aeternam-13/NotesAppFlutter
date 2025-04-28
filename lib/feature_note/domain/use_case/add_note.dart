import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class AddNote {
  final NoteRepository repository;

  AddNote(this.repository);

  Future<void> call(Note note) async {
    if (note.title.trim().isEmpty) {
      throw InvalidNoteException('Title is empty');
    }
    if (note.content.trim().isEmpty) {
      throw InvalidNoteException('Content is empty');
    }
    await repository.insertNote(note);
  }
}
