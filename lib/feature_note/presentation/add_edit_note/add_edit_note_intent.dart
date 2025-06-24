sealed class AddEditNoteIntent {}

class EnteredTitleIntent extends AddEditNoteIntent {
  final String value;
  EnteredTitleIntent({required this.value});
}

class EnteredContentIntent extends AddEditNoteIntent {
  final String value;
  EnteredContentIntent({required this.value});
}

class ChangeNoteColorIntent extends AddEditNoteIntent {
  final int color;
  ChangeNoteColorIntent({required this.color});
}

class SaveNoteIntent extends AddEditNoteIntent {}
