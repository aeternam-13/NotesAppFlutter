import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao_api.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao_hive.dart';
import 'package:notesappflutter/feature_note/domain/model/storage_mode.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class SwitchStorageMode {
  final NoteRepository _repository;
  final void Function(NoteDao) _switchStorage;

  SwitchStorageMode(this._repository, this._switchStorage);

  void call(StorageMode mode) {
    NoteDao dao = mode == StorageMode.api ? NoteDaoApi() : NoteDaoHive();

    _switchStorage(dao);
    _repository.setDao(dao);
  }
}
