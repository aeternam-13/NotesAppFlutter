import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/note_order.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/order_type.dart';

class GetNotes {
  final NoteRepository _repository;

  GetNotes(this._repository);

  Stream<Result<List<Note>, NoteException>> call({
    NoteOrder noteOrder = const NoteOrderDate(Descending()),
  }) {
    return _repository.getNotes().map((result) {
      return result.map(
        successMapper: (notes) {
          switch (noteOrder.orderType) {
            case Ascending():
              return _sortNotesAscending(notes, noteOrder);
            case Descending():
              return _sortNotesDescending(notes, noteOrder);
          }
        },
        errorMapper: (noteException) => noteException,
      );
    });
  }

  List<Note> _sortNotesAscending(List<Note> notes, NoteOrder noteOrder) {
    if (noteOrder is NoteOrderTitle) {
      return notes..sort(
        (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
      );
    } else if (noteOrder is NoteOrderDate) {
      return notes..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    } else if (noteOrder is NoteOrderColor) {
      return notes..sort((a, b) => a.color.compareTo(b.color));
    }
    return notes;
  }

  List<Note> _sortNotesDescending(List<Note> notes, NoteOrder noteOrder) {
    if (noteOrder is NoteOrderTitle) {
      return notes..sort(
        (a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()),
      );
    } else if (noteOrder is NoteOrderDate) {
      return notes..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    } else if (noteOrder is NoteOrderColor) {
      return notes..sort((a, b) => b.color.compareTo(a.color));
    }
    return notes;
  }
}
