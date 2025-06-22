sealed class NoteException implements Exception {
  final String message;
  NoteException(this.message);
}

class NoteApiException extends NoteException {
  final int statusCode;
  NoteApiException(super.message, this.statusCode);
}

class NoteStreamException extends NoteException {
  NoteStreamException(super.message);
}
