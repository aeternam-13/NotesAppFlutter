// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notes_state.dart';

class NotesStateMapper extends ClassMapperBase<NotesState> {
  NotesStateMapper._();

  static NotesStateMapper? _instance;
  static NotesStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotesStateMapper._());
      NoteMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotesState';

  static List<Note> _$notes(NotesState v) => v.notes;
  static const Field<NotesState, List<Note>> _f$notes =
      Field('notes', _$notes, opt: true, def: const []);
  static NoteOrder _$noteOrder(NotesState v) => v.noteOrder;
  static const Field<NotesState, NoteOrder> _f$noteOrder = Field(
      'noteOrder', _$noteOrder,
      opt: true, def: const NoteOrderDate(Descending()));
  static bool _$isOrderSectionVisible(NotesState v) => v.isOrderSectionVisible;
  static const Field<NotesState, bool> _f$isOrderSectionVisible = Field(
      'isOrderSectionVisible', _$isOrderSectionVisible,
      opt: true, def: false);

  @override
  final MappableFields<NotesState> fields = const {
    #notes: _f$notes,
    #noteOrder: _f$noteOrder,
    #isOrderSectionVisible: _f$isOrderSectionVisible,
  };

  static NotesState _instantiate(DecodingData data) {
    return NotesState(
        notes: data.dec(_f$notes),
        noteOrder: data.dec(_f$noteOrder),
        isOrderSectionVisible: data.dec(_f$isOrderSectionVisible));
  }

  @override
  final Function instantiate = _instantiate;

  static NotesState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotesState>(map);
  }

  static NotesState fromJson(String json) {
    return ensureInitialized().decodeJson<NotesState>(json);
  }
}

mixin NotesStateMappable {
  String toJson() {
    return NotesStateMapper.ensureInitialized()
        .encodeJson<NotesState>(this as NotesState);
  }

  Map<String, dynamic> toMap() {
    return NotesStateMapper.ensureInitialized()
        .encodeMap<NotesState>(this as NotesState);
  }

  NotesStateCopyWith<NotesState, NotesState, NotesState> get copyWith =>
      _NotesStateCopyWithImpl<NotesState, NotesState>(
          this as NotesState, $identity, $identity);
  @override
  String toString() {
    return NotesStateMapper.ensureInitialized()
        .stringifyValue(this as NotesState);
  }

  @override
  bool operator ==(Object other) {
    return NotesStateMapper.ensureInitialized()
        .equalsValue(this as NotesState, other);
  }

  @override
  int get hashCode {
    return NotesStateMapper.ensureInitialized().hashValue(this as NotesState);
  }
}

extension NotesStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotesState, $Out> {
  NotesStateCopyWith<$R, NotesState, $Out> get $asNotesState =>
      $base.as((v, t, t2) => _NotesStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NotesStateCopyWith<$R, $In extends NotesState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Note, NoteCopyWith<$R, Note, Note>> get notes;
  $R call(
      {List<Note>? notes, NoteOrder? noteOrder, bool? isOrderSectionVisible});
  NotesStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NotesStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotesState, $Out>
    implements NotesStateCopyWith<$R, NotesState, $Out> {
  _NotesStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotesState> $mapper =
      NotesStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Note, NoteCopyWith<$R, Note, Note>> get notes =>
      ListCopyWith(
          $value.notes, (v, t) => v.copyWith.$chain(t), (v) => call(notes: v));
  @override
  $R call(
          {List<Note>? notes,
          NoteOrder? noteOrder,
          bool? isOrderSectionVisible}) =>
      $apply(FieldCopyWithData({
        if (notes != null) #notes: notes,
        if (noteOrder != null) #noteOrder: noteOrder,
        if (isOrderSectionVisible != null)
          #isOrderSectionVisible: isOrderSectionVisible
      }));
  @override
  NotesState $make(CopyWithData data) => NotesState(
      notes: data.get(#notes, or: $value.notes),
      noteOrder: data.get(#noteOrder, or: $value.noteOrder),
      isOrderSectionVisible:
          data.get(#isOrderSectionVisible, or: $value.isOrderSectionVisible));

  @override
  NotesStateCopyWith<$R2, NotesState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NotesStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
