import 'package:hive_ce/hive.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<Note>()])
// Annotations must be on some element
// ignore: unused_element
void _() {}
