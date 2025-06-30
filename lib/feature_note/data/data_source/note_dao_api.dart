import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';
import 'package:http/http.dart' as http;

class NoteDaoApi extends NoteDao {
  final String _baseUrl = "http://localhost:8080/notes";
  final int _requestTimeout = 5;
  final _streamController =
      StreamController<Result<List<Note>, NoteException>>();
  List<Note> _notes = [];

  @override
  Future<Result<Unit, NoteException>> deleteNote(int id) async {
    try {
      final response = await http
          .delete(Uri.parse('$_baseUrl/$id'), headers: _buildHeaders())
          .timeout(
            Duration(seconds: _requestTimeout),
            onTimeout: () => _timeoutResponse(),
          );
      switch (response.statusCode) {
        case HttpStatus.noContent:
          _notes.removeWhere((element) => element.id == id);
          _notes = [..._notes];
          _streamController.add(Success(_notes));
          return Success(unit);
        default:
          return Error(
            NoteApiException(
              response.reasonPhrase ?? "Error updating the Note",
              response.statusCode,
            ),
          );
      }
    } catch (e) {
      return Error(NoteApiException("Error during api request", 99999));
    }
  }

  @override
  Future<Note?> getNoteById(int id) async {
    for (Note note in _notes) {
      if (note.id == id) return note;
    }

    return null;
  }

  @override
  Stream<Result<List<Note>, NoteException>> getNotes() async* {
    final res = await _readAllNotes();

    res.mapSuccess((notes) => _notes = [...notes]);

    yield res;

    yield* _streamController.stream;
  }

  @override
  Future<Result<Unit, NoteException>> updateNote(Note note) async {
    return await _updateNote(note);
  }

  Future<Result<Unit, NoteException>> _updateNote(Note note) async {
    try {
      final response = await http
          .put(
            Uri.parse('$_baseUrl/${note.id}'),
            headers: _buildHeaders(),
            body: note.toJson(),
          )
          .timeout(
            Duration(seconds: _requestTimeout),
            onTimeout: () => _timeoutResponse(),
          );
      switch (response.statusCode) {
        case HttpStatus.ok:
          final Note note = _parseNote(response.body);
          _replaceWhere(note);
          _streamController.add(Success(_notes));
          return Success(unit);
        default:
          return Error(
            NoteApiException(
              response.reasonPhrase ?? "Error updating the Note",
              response.statusCode,
            ),
          );
      }
    } catch (e) {
      return Error(NoteApiException("Error during api request", 99999));
    }
  }

  void _replaceWhere(Note note) {
    _notes.removeWhere((element) => element.id == note.id);
    _notes = [note, ..._notes];
    _streamController.add(Success(_notes));
  }

  @override
  Future<Result<Unit, NoteException>> saveNote(Note note) async {
    try {
      final response = await http
          .post(
            Uri.parse(_baseUrl),
            headers: _buildHeaders(),
            body: note.toJson(),
          )
          .timeout(
            Duration(seconds: _requestTimeout),
            onTimeout: () => _timeoutResponse(),
          );
      switch (response.statusCode) {
        case HttpStatus.created:
          final Note note = _parseNote(response.body);

          _notes = [..._notes, note];
          _streamController.add(Success(_notes));
          return Success(unit);
        default:
          return Error(
            NoteApiException(
              response.reasonPhrase ?? "Error creating the new Note",
              response.statusCode,
            ),
          );
      }
    } catch (e) {
      return Error(
        NoteApiException("Error creating the new Note FATAL", 99999),
      );
    }
  }

  // Method to parse all Notes [List<Note>]
  List<Note> _parseNotesJson(String responseBody) {
    try {
      List<Note> notes = [];
      final jsonBody = jsonDecode(responseBody);

      for (Map<String, dynamic> note in jsonBody) {
        notes.add(NoteMapper.fromMap(note));
      }
      return notes;
    } catch (e) {
      rethrow;
    }
  }

  Future<Result<List<Note>, NoteApiException>> _readAllNotes() async {
    try {
      final response = await http
          .get(Uri.parse(_baseUrl), headers: _buildHeaders())
          .timeout(
            Duration(seconds: _requestTimeout),
            onTimeout: () => _timeoutResponse(),
          );
      switch (response.statusCode) {
        case HttpStatus.ok:
          final List<Note> notes = await compute(
            _parseNotesJson,
            response.body,
          );
          return Success(notes);
        default:
          return Error(
            NoteApiException(
              response.reasonPhrase ?? "Error getting all notes",
              response.statusCode,
            ),
          );
      }
    } catch (e) {
      return Error(NoteApiException("Error during api request", 99999));
    }
  }
}

Map<String, String> _buildHeaders() {
  Map<String, String> headers = {};

  headers[HttpHeaders.contentTypeHeader] = "application/json";

  return headers;
}

Response _timeoutResponse() =>
    http.Response("Request timeout", HttpStatus.requestTimeout);
Note _parseNote(String body) {
  try {
    Note note = NoteMapper.fromMap(jsonDecode(body));
    return note;
  } catch (e) {
    rethrow;
  }
}
