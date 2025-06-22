// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'add_edit_note_state.dart';

class AddEditNoteStateMapper extends ClassMapperBase<AddEditNoteState> {
  AddEditNoteStateMapper._();

  static AddEditNoteStateMapper? _instance;
  static AddEditNoteStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddEditNoteStateMapper._());
      NoteTextFieldStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AddEditNoteState';

  static NoteTextFieldState _$noteTitle(AddEditNoteState v) => v.noteTitle;
  static const Field<AddEditNoteState, NoteTextFieldState> _f$noteTitle = Field(
      'noteTitle', _$noteTitle,
      opt: true, def: const NoteTextFieldState(hint: "Enter title"));
  static NoteTextFieldState _$noteContent(AddEditNoteState v) => v.noteContent;
  static const Field<AddEditNoteState, NoteTextFieldState> _f$noteContent =
      Field('noteContent', _$noteContent,
          opt: true, def: const NoteTextFieldState(hint: "Enter some content"));
  static int _$noteColor(AddEditNoteState v) => v.noteColor;
  static const Field<AddEditNoteState, int> _f$noteColor =
      Field('noteColor', _$noteColor, opt: true);
  static int _$currentNoteId(AddEditNoteState v) => v.currentNoteId;
  static const Field<AddEditNoteState, int> _f$currentNoteId =
      Field('currentNoteId', _$currentNoteId, opt: true, def: -1);

  @override
  final MappableFields<AddEditNoteState> fields = const {
    #noteTitle: _f$noteTitle,
    #noteContent: _f$noteContent,
    #noteColor: _f$noteColor,
    #currentNoteId: _f$currentNoteId,
  };

  static AddEditNoteState _instantiate(DecodingData data) {
    return AddEditNoteState(
        noteTitle: data.dec(_f$noteTitle),
        noteContent: data.dec(_f$noteContent),
        noteColor: data.dec(_f$noteColor),
        currentNoteId: data.dec(_f$currentNoteId));
  }

  @override
  final Function instantiate = _instantiate;

  static AddEditNoteState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddEditNoteState>(map);
  }

  static AddEditNoteState fromJson(String json) {
    return ensureInitialized().decodeJson<AddEditNoteState>(json);
  }
}

mixin AddEditNoteStateMappable {
  String toJson() {
    return AddEditNoteStateMapper.ensureInitialized()
        .encodeJson<AddEditNoteState>(this as AddEditNoteState);
  }

  Map<String, dynamic> toMap() {
    return AddEditNoteStateMapper.ensureInitialized()
        .encodeMap<AddEditNoteState>(this as AddEditNoteState);
  }

  AddEditNoteStateCopyWith<AddEditNoteState, AddEditNoteState, AddEditNoteState>
      get copyWith =>
          _AddEditNoteStateCopyWithImpl<AddEditNoteState, AddEditNoteState>(
              this as AddEditNoteState, $identity, $identity);
  @override
  String toString() {
    return AddEditNoteStateMapper.ensureInitialized()
        .stringifyValue(this as AddEditNoteState);
  }

  @override
  bool operator ==(Object other) {
    return AddEditNoteStateMapper.ensureInitialized()
        .equalsValue(this as AddEditNoteState, other);
  }

  @override
  int get hashCode {
    return AddEditNoteStateMapper.ensureInitialized()
        .hashValue(this as AddEditNoteState);
  }
}

extension AddEditNoteStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddEditNoteState, $Out> {
  AddEditNoteStateCopyWith<$R, AddEditNoteState, $Out>
      get $asAddEditNoteState => $base
          .as((v, t, t2) => _AddEditNoteStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AddEditNoteStateCopyWith<$R, $In extends AddEditNoteState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  NoteTextFieldStateCopyWith<$R, NoteTextFieldState, NoteTextFieldState>
      get noteTitle;
  NoteTextFieldStateCopyWith<$R, NoteTextFieldState, NoteTextFieldState>
      get noteContent;
  $R call(
      {NoteTextFieldState? noteTitle,
      NoteTextFieldState? noteContent,
      int? noteColor,
      int? currentNoteId});
  AddEditNoteStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AddEditNoteStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddEditNoteState, $Out>
    implements AddEditNoteStateCopyWith<$R, AddEditNoteState, $Out> {
  _AddEditNoteStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddEditNoteState> $mapper =
      AddEditNoteStateMapper.ensureInitialized();
  @override
  NoteTextFieldStateCopyWith<$R, NoteTextFieldState, NoteTextFieldState>
      get noteTitle =>
          $value.noteTitle.copyWith.$chain((v) => call(noteTitle: v));
  @override
  NoteTextFieldStateCopyWith<$R, NoteTextFieldState, NoteTextFieldState>
      get noteContent =>
          $value.noteContent.copyWith.$chain((v) => call(noteContent: v));
  @override
  $R call(
          {NoteTextFieldState? noteTitle,
          NoteTextFieldState? noteContent,
          Object? noteColor = $none,
          int? currentNoteId}) =>
      $apply(FieldCopyWithData({
        if (noteTitle != null) #noteTitle: noteTitle,
        if (noteContent != null) #noteContent: noteContent,
        if (noteColor != $none) #noteColor: noteColor,
        if (currentNoteId != null) #currentNoteId: currentNoteId
      }));
  @override
  AddEditNoteState $make(CopyWithData data) => AddEditNoteState(
      noteTitle: data.get(#noteTitle, or: $value.noteTitle),
      noteContent: data.get(#noteContent, or: $value.noteContent),
      noteColor: data.get(#noteColor, or: $value.noteColor),
      currentNoteId: data.get(#currentNoteId, or: $value.currentNoteId));

  @override
  AddEditNoteStateCopyWith<$R2, AddEditNoteState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AddEditNoteStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
