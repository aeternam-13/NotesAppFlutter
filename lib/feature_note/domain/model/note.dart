import 'dart:ui';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:hive_ce/hive.dart';

part 'note.mapper.dart';

@MappableClass()
class Note extends HiveObject with NoteMappable {
  final String title;
  final String content;
  final int timestamp;
  final int color;
  final int id;

  Note(this.title, this.content, this.timestamp, this.color, this.id);

  static const List<Color> noteColors = [
    Color(0xFFFF8C93),
    Color(0xFF51C79B),
    Color(0xFFDC6958),
    Color(0xFF6AE78C),
    Color(0xFFD896FF),
    Color(0xFFE2D528),
  ];
}

class InvalidNoteException implements Exception {
  final String message;
  InvalidNoteException(this.message);
}
