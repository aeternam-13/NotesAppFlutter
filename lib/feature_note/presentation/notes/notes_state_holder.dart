import 'package:dart_mappable/dart_mappable.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/note_order.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/order_type.dart';

part 'notes_state_holder.mapper.dart';

@MappableClass()
class NotesStateHolder with NotesStateHolderMappable {
  final List<Note> notes;
  final NoteOrder noteOrder;
  final bool isOrderSectionVisible;

  const NotesStateHolder({
    this.notes = const [],
    this.noteOrder = const NoteOrderDate(Descending()),
    this.isOrderSectionVisible = false,
  });
}
