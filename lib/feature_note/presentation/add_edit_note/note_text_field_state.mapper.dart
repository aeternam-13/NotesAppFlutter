// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'note_text_field_state.dart';

class NoteTextFieldStateMapper extends ClassMapperBase<NoteTextFieldState> {
  NoteTextFieldStateMapper._();

  static NoteTextFieldStateMapper? _instance;
  static NoteTextFieldStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NoteTextFieldStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NoteTextFieldState';

  static String _$hint(NoteTextFieldState v) => v.hint;
  static const Field<NoteTextFieldState, String> _f$hint =
      Field('hint', _$hint, opt: true, def: "");
  static String _$text(NoteTextFieldState v) => v.text;
  static const Field<NoteTextFieldState, String> _f$text =
      Field('text', _$text, opt: true, def: "");
  static bool _$isHintVisible(NoteTextFieldState v) => v.isHintVisible;
  static const Field<NoteTextFieldState, bool> _f$isHintVisible =
      Field('isHintVisible', _$isHintVisible, opt: true, def: true);

  @override
  final MappableFields<NoteTextFieldState> fields = const {
    #hint: _f$hint,
    #text: _f$text,
    #isHintVisible: _f$isHintVisible,
  };

  static NoteTextFieldState _instantiate(DecodingData data) {
    return NoteTextFieldState(
        hint: data.dec(_f$hint),
        text: data.dec(_f$text),
        isHintVisible: data.dec(_f$isHintVisible));
  }

  @override
  final Function instantiate = _instantiate;

  static NoteTextFieldState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NoteTextFieldState>(map);
  }

  static NoteTextFieldState fromJson(String json) {
    return ensureInitialized().decodeJson<NoteTextFieldState>(json);
  }
}

mixin NoteTextFieldStateMappable {
  String toJson() {
    return NoteTextFieldStateMapper.ensureInitialized()
        .encodeJson<NoteTextFieldState>(this as NoteTextFieldState);
  }

  Map<String, dynamic> toMap() {
    return NoteTextFieldStateMapper.ensureInitialized()
        .encodeMap<NoteTextFieldState>(this as NoteTextFieldState);
  }

  NoteTextFieldStateCopyWith<NoteTextFieldState, NoteTextFieldState,
          NoteTextFieldState>
      get copyWith => _NoteTextFieldStateCopyWithImpl<NoteTextFieldState,
          NoteTextFieldState>(this as NoteTextFieldState, $identity, $identity);
  @override
  String toString() {
    return NoteTextFieldStateMapper.ensureInitialized()
        .stringifyValue(this as NoteTextFieldState);
  }

  @override
  bool operator ==(Object other) {
    return NoteTextFieldStateMapper.ensureInitialized()
        .equalsValue(this as NoteTextFieldState, other);
  }

  @override
  int get hashCode {
    return NoteTextFieldStateMapper.ensureInitialized()
        .hashValue(this as NoteTextFieldState);
  }
}

extension NoteTextFieldStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NoteTextFieldState, $Out> {
  NoteTextFieldStateCopyWith<$R, NoteTextFieldState, $Out>
      get $asNoteTextFieldState => $base.as(
          (v, t, t2) => _NoteTextFieldStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NoteTextFieldStateCopyWith<$R, $In extends NoteTextFieldState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? hint, String? text, bool? isHintVisible});
  NoteTextFieldStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NoteTextFieldStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NoteTextFieldState, $Out>
    implements NoteTextFieldStateCopyWith<$R, NoteTextFieldState, $Out> {
  _NoteTextFieldStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NoteTextFieldState> $mapper =
      NoteTextFieldStateMapper.ensureInitialized();
  @override
  $R call({String? hint, String? text, bool? isHintVisible}) =>
      $apply(FieldCopyWithData({
        if (hint != null) #hint: hint,
        if (text != null) #text: text,
        if (isHintVisible != null) #isHintVisible: isHintVisible
      }));
  @override
  NoteTextFieldState $make(CopyWithData data) => NoteTextFieldState(
      hint: data.get(#hint, or: $value.hint),
      text: data.get(#text, or: $value.text),
      isHintVisible: data.get(#isHintVisible, or: $value.isHintVisible));

  @override
  NoteTextFieldStateCopyWith<$R2, NoteTextFieldState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NoteTextFieldStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
