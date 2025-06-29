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
  final String _baseUrl = "http://localhost:8080/notes/";
  final int _requestTimeout = 5;
  final _streamController =
      StreamController<Result<List<Note>, NoteException>>();
  final List<Note> _notes = [];

  @override
  Future<void> deleteNote(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Note?> getNoteById(int id) {
    throw UnimplementedError();
  }

  @override
  Stream<Result<List<Note>, NoteException>> getNotes() async* {
    yield await _readAllNotes();
    yield* _streamController.stream;
  }

  @override
  Future<void> insertNote(Note note) {
    throw UnimplementedError();
  }

  // Static method for JSON parsing to be run in an Isolate
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
              response.reasonPhrase ?? "Error",
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
