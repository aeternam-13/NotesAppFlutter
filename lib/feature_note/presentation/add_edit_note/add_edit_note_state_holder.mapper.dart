// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'add_edit_note_state_holder.dart';

class AddEditNoteStateHolderMapper
    extends ClassMapperBase<AddEditNoteStateHolder> {
  AddEditNoteStateHolderMapper._();

  static AddEditNoteStateHolderMapper? _instance;
  static AddEditNoteStateHolderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddEditNoteStateHolderMapper._());
      NoteTextFieldStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AddEditNoteStateHolder';

  static NoteTextFieldState _$noteTitle(AddEditNoteStateHolder v) =>
      v.noteTitle;
  static const Field<AddEditNoteStateHolder, NoteTextFieldState> _f$noteTitle =
      Field('noteTitle', _$noteTitle,
          opt: true, def: const NoteTextFieldState(hint: "Enter title"));
  static NoteTextFieldState _$noteContent(AddEditNoteStateHolder v) =>
      v.noteContent;
  static const Field<AddEditNoteStateHolder, NoteTextFieldState>
      _f$noteContent = Field('noteContent', _$noteContent,
          opt: true, def: const NoteTextFieldState(hint: "Enter some content"));
  static int _$noteColor(AddEditNoteStateHolder v) => v.noteColor;
  static const Field<AddEditNoteStateHolder, int> _f$noteColor =
      Field('noteColor', _$noteColor, opt: true);
  static int _$currentNoteId(AddEditNoteStateHolder v) => v.currentNoteId;
  static const Field<AddEditNoteStateHolder, int> _f$currentNoteId =
      Field('currentNoteId', _$currentNoteId, opt: true, def: -1);

  @override
  final MappableFields<AddEditNoteStateHolder> fields = const {
    #noteTitle: _f$noteTitle,
    #noteContent: _f$noteContent,
    #noteColor: _f$noteColor,
    #currentNoteId: _f$currentNoteId,
  };

  static AddEditNoteStateHolder _instantiate(DecodingData data) {
    return AddEditNoteStateHolder(
        noteTitle: data.dec(_f$noteTitle),
        noteContent: data.dec(_f$noteContent),
        noteColor: data.dec(_f$noteColor),
        currentNoteId: data.dec(_f$currentNoteId));
  }

  @override
  final Function instantiate = _instantiate;

  static AddEditNoteStateHolder fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddEditNoteStateHolder>(map);
  }

  static AddEditNoteStateHolder fromJson(String json) {
    return ensureInitialized().decodeJson<AddEditNoteStateHolder>(json);
  }
}

mixin AddEditNoteStateHolderMappable {
  String toJson() {
    return AddEditNoteStateHolderMapper.ensureInitialized()
        .encodeJson<AddEditNoteStateHolder>(this as AddEditNoteStateHolder);
  }

  Map<String, dynamic> toMap() {
    return AddEditNoteStateHolderMapper.ensureInitialized()
        .encodeMap<AddEditNoteStateHolder>(this as AddEditNoteStateHolder);
  }

  AddEditNoteStateHolderCopyWith<AddEditNoteStateHolder, AddEditNoteStateHolder,
          AddEditNoteStateHolder>
      get copyWith => _AddEditNoteStateHolderCopyWithImpl<
              AddEditNoteStateHolder, AddEditNoteStateHolder>(
          this as AddEditNoteStateHolder, $identity, $identity);
  @override
  String toString() {
    return AddEditNoteStateHolderMapper.ensureInitialized()
        .stringifyValue(this as AddEditNoteStateHolder);
  }

  @override
  bool operator ==(Object other) {
    return AddEditNoteStateHolderMapper.ensureInitialized()
        .equalsValue(this as AddEditNoteStateHolder, other);
  }

  @override
  int get hashCode {
    return AddEditNoteStateHolderMapper.ensureInitialized()
        .hashValue(this as AddEditNoteStateHolder);
  }
}

extension AddEditNoteStateHolderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddEditNoteStateHolder, $Out> {
  AddEditNoteStateHolderCopyWith<$R, AddEditNoteStateHolder, $Out>
      get $asAddEditNoteStateHolder => $base.as((v, t, t2) =>
          _AddEditNoteStateHolderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AddEditNoteStateHolderCopyWith<
    $R,
    $In extends AddEditNoteStateHolder,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  NoteTextFieldStateCopyWith<$R, NoteTextFieldState, NoteTextFieldState>
      get noteTitle;
  NoteTextFieldStateCopyWith<$R, NoteTextFieldState, NoteTextFieldState>
      get noteContent;
  $R call(
      {NoteTextFieldState? noteTitle,
      NoteTextFieldState? noteContent,
      int? noteColor,
      int? currentNoteId});
  AddEditNoteStateHolderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AddEditNoteStateHolderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddEditNoteStateHolder, $Out>
    implements
        AddEditNoteStateHolderCopyWith<$R, AddEditNoteStateHolder, $Out> {
  _AddEditNoteStateHolderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddEditNoteStateHolder> $mapper =
      AddEditNoteStateHolderMapper.ensureInitialized();
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
  AddEditNoteStateHolder $make(CopyWithData data) => AddEditNoteStateHolder(
      noteTitle: data.get(#noteTitle, or: $value.noteTitle),
      noteContent: data.get(#noteContent, or: $value.noteContent),
      noteColor: data.get(#noteColor, or: $value.noteColor),
      currentNoteId: data.get(#currentNoteId, or: $value.currentNoteId));

  @override
  AddEditNoteStateHolderCopyWith<$R2, AddEditNoteStateHolder, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AddEditNoteStateHolderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
