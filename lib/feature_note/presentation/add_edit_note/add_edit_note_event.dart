sealed class AddEditNoteEvent {}

class EnteredTitle extends AddEditNoteEvent {
  final String value;
  EnteredTitle({required this.value});
}

class EnteredContent extends AddEditNoteEvent {
  final String value;
  EnteredContent({required this.value});
}

class ChangeColor extends AddEditNoteEvent {
  final int color;
  ChangeColor({required this.color});
}

class SaveNote extends AddEditNoteEvent {}
