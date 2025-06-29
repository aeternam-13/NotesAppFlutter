import 'package:dart_mappable/dart_mappable.dart';

part 'note_text_field_state.mapper.dart';

@MappableClass()
class NoteTextFieldState with NoteTextFieldStateMappable {
  final String text;
  final String hint;

  const NoteTextFieldState({this.hint = "", this.text = ""});
}
