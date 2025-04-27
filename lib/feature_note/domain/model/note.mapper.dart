// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'note.dart';

class NoteMapper extends ClassMapperBase<Note> {
  NoteMapper._();

  static NoteMapper? _instance;
  static NoteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NoteMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Note';

  static String _$title(Note v) => v.title;
  static const Field<Note, String> _f$title = Field('title', _$title);
  static String _$content(Note v) => v.content;
  static const Field<Note, String> _f$content = Field('content', _$content);
  static int _$timestamp(Note v) => v.timestamp;
  static const Field<Note, int> _f$timestamp = Field('timestamp', _$timestamp);
  static int _$color(Note v) => v.color;
  static const Field<Note, int> _f$color = Field('color', _$color);
  static int _$id(Note v) => v.id;
  static const Field<Note, int> _f$id = Field('id', _$id);

  @override
  final MappableFields<Note> fields = const {
    #title: _f$title,
    #content: _f$content,
    #timestamp: _f$timestamp,
    #color: _f$color,
    #id: _f$id,
  };

  static Note _instantiate(DecodingData data) {
    return Note(
        title: data.dec(_f$title),
        content: data.dec(_f$content),
        timestamp: data.dec(_f$timestamp),
        color: data.dec(_f$color),
        id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static Note fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Note>(map);
  }

  static Note fromJson(String json) {
    return ensureInitialized().decodeJson<Note>(json);
  }
}

mixin NoteMappable {
  String toJson() {
    return NoteMapper.ensureInitialized().encodeJson<Note>(this as Note);
  }

  Map<String, dynamic> toMap() {
    return NoteMapper.ensureInitialized().encodeMap<Note>(this as Note);
  }

  NoteCopyWith<Note, Note, Note> get copyWith =>
      _NoteCopyWithImpl<Note, Note>(this as Note, $identity, $identity);
  @override
  String toString() {
    return NoteMapper.ensureInitialized().stringifyValue(this as Note);
  }

  @override
  bool operator ==(Object other) {
    return NoteMapper.ensureInitialized().equalsValue(this as Note, other);
  }

  @override
  int get hashCode {
    return NoteMapper.ensureInitialized().hashValue(this as Note);
  }
}

extension NoteValueCopy<$R, $Out> on ObjectCopyWith<$R, Note, $Out> {
  NoteCopyWith<$R, Note, $Out> get $asNote =>
      $base.as((v, t, t2) => _NoteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NoteCopyWith<$R, $In extends Note, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? title, String? content, int? timestamp, int? color, int? id});
  NoteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NoteCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Note, $Out>
    implements NoteCopyWith<$R, Note, $Out> {
  _NoteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Note> $mapper = NoteMapper.ensureInitialized();
  @override
  $R call(
          {String? title,
          String? content,
          int? timestamp,
          int? color,
          int? id}) =>
      $apply(FieldCopyWithData({
        if (title != null) #title: title,
        if (content != null) #content: content,
        if (timestamp != null) #timestamp: timestamp,
        if (color != null) #color: color,
        if (id != null) #id: id
      }));
  @override
  Note $make(CopyWithData data) => Note(
      title: data.get(#title, or: $value.title),
      content: data.get(#content, or: $value.content),
      timestamp: data.get(#timestamp, or: $value.timestamp),
      color: data.get(#color, or: $value.color),
      id: data.get(#id, or: $value.id));

  @override
  NoteCopyWith<$R2, Note, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NoteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
