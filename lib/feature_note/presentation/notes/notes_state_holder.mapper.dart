// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notes_state_holder.dart';

class NotesStateHolderMapper extends ClassMapperBase<NotesStateHolder> {
  NotesStateHolderMapper._();

  static NotesStateHolderMapper? _instance;
  static NotesStateHolderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotesStateHolderMapper._());
      NoteMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotesStateHolder';

  static List<Note> _$notes(NotesStateHolder v) => v.notes;
  static const Field<NotesStateHolder, List<Note>> _f$notes =
      Field('notes', _$notes, opt: true, def: const []);
  static NoteOrder _$noteOrder(NotesStateHolder v) => v.noteOrder;
  static const Field<NotesStateHolder, NoteOrder> _f$noteOrder = Field(
      'noteOrder', _$noteOrder,
      opt: true, def: const NoteOrderDate(Descending()));
  static bool _$isOrderSectionVisible(NotesStateHolder v) =>
      v.isOrderSectionVisible;
  static const Field<NotesStateHolder, bool> _f$isOrderSectionVisible = Field(
      'isOrderSectionVisible', _$isOrderSectionVisible,
      opt: true, def: false);

  @override
  final MappableFields<NotesStateHolder> fields = const {
    #notes: _f$notes,
    #noteOrder: _f$noteOrder,
    #isOrderSectionVisible: _f$isOrderSectionVisible,
  };

  static NotesStateHolder _instantiate(DecodingData data) {
    return NotesStateHolder(
        notes: data.dec(_f$notes),
        noteOrder: data.dec(_f$noteOrder),
        isOrderSectionVisible: data.dec(_f$isOrderSectionVisible));
  }

  @override
  final Function instantiate = _instantiate;

  static NotesStateHolder fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotesStateHolder>(map);
  }

  static NotesStateHolder fromJson(String json) {
    return ensureInitialized().decodeJson<NotesStateHolder>(json);
  }
}

mixin NotesStateHolderMappable {
  String toJson() {
    return NotesStateHolderMapper.ensureInitialized()
        .encodeJson<NotesStateHolder>(this as NotesStateHolder);
  }

  Map<String, dynamic> toMap() {
    return NotesStateHolderMapper.ensureInitialized()
        .encodeMap<NotesStateHolder>(this as NotesStateHolder);
  }

  NotesStateHolderCopyWith<NotesStateHolder, NotesStateHolder, NotesStateHolder>
      get copyWith =>
          _NotesStateHolderCopyWithImpl<NotesStateHolder, NotesStateHolder>(
              this as NotesStateHolder, $identity, $identity);
  @override
  String toString() {
    return NotesStateHolderMapper.ensureInitialized()
        .stringifyValue(this as NotesStateHolder);
  }

  @override
  bool operator ==(Object other) {
    return NotesStateHolderMapper.ensureInitialized()
        .equalsValue(this as NotesStateHolder, other);
  }

  @override
  int get hashCode {
    return NotesStateHolderMapper.ensureInitialized()
        .hashValue(this as NotesStateHolder);
  }
}

extension NotesStateHolderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotesStateHolder, $Out> {
  NotesStateHolderCopyWith<$R, NotesStateHolder, $Out>
      get $asNotesStateHolder => $base
          .as((v, t, t2) => _NotesStateHolderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NotesStateHolderCopyWith<$R, $In extends NotesStateHolder, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Note, NoteCopyWith<$R, Note, Note>> get notes;
  $R call(
      {List<Note>? notes, NoteOrder? noteOrder, bool? isOrderSectionVisible});
  NotesStateHolderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NotesStateHolderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotesStateHolder, $Out>
    implements NotesStateHolderCopyWith<$R, NotesStateHolder, $Out> {
  _NotesStateHolderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotesStateHolder> $mapper =
      NotesStateHolderMapper.ensureInitialized();
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
  NotesStateHolder $make(CopyWithData data) => NotesStateHolder(
      notes: data.get(#notes, or: $value.notes),
      noteOrder: data.get(#noteOrder, or: $value.noteOrder),
      isOrderSectionVisible:
          data.get(#isOrderSectionVisible, or: $value.isOrderSectionVisible));

  @override
  NotesStateHolderCopyWith<$R2, NotesStateHolder, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NotesStateHolderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
