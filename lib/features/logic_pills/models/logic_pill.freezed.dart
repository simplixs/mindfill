// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logic_pill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogicPill _$LogicPillFromJson(Map<String, dynamic> json) {
  return _LogicPill.fromJson(json);
}

/// @nodoc
mixin _$LogicPill {
  String get type => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer')
  String get correctAnswer => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;

  /// Serializes this LogicPill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogicPill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogicPillCopyWith<LogicPill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogicPillCopyWith<$Res> {
  factory $LogicPillCopyWith(LogicPill value, $Res Function(LogicPill) then) =
      _$LogicPillCopyWithImpl<$Res, LogicPill>;
  @useResult
  $Res call(
      {String type,
      String question,
      List<String> options,
      @JsonKey(name: 'correct_answer') String correctAnswer,
      String explanation});
}

/// @nodoc
class _$LogicPillCopyWithImpl<$Res, $Val extends LogicPill>
    implements $LogicPillCopyWith<$Res> {
  _$LogicPillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogicPill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? question = null,
    Object? options = null,
    Object? correctAnswer = null,
    Object? explanation = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogicPillImplCopyWith<$Res>
    implements $LogicPillCopyWith<$Res> {
  factory _$$LogicPillImplCopyWith(
          _$LogicPillImpl value, $Res Function(_$LogicPillImpl) then) =
      __$$LogicPillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String question,
      List<String> options,
      @JsonKey(name: 'correct_answer') String correctAnswer,
      String explanation});
}

/// @nodoc
class __$$LogicPillImplCopyWithImpl<$Res>
    extends _$LogicPillCopyWithImpl<$Res, _$LogicPillImpl>
    implements _$$LogicPillImplCopyWith<$Res> {
  __$$LogicPillImplCopyWithImpl(
      _$LogicPillImpl _value, $Res Function(_$LogicPillImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogicPill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? question = null,
    Object? options = null,
    Object? correctAnswer = null,
    Object? explanation = null,
  }) {
    return _then(_$LogicPillImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogicPillImpl implements _LogicPill {
  const _$LogicPillImpl(
      {required this.type,
      required this.question,
      required final List<String> options,
      @JsonKey(name: 'correct_answer') required this.correctAnswer,
      required this.explanation})
      : _options = options;

  factory _$LogicPillImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogicPillImplFromJson(json);

  @override
  final String type;
  @override
  final String question;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  @JsonKey(name: 'correct_answer')
  final String correctAnswer;
  @override
  final String explanation;

  @override
  String toString() {
    return 'LogicPill(type: $type, question: $question, options: $options, correctAnswer: $correctAnswer, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogicPillImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      question,
      const DeepCollectionEquality().hash(_options),
      correctAnswer,
      explanation);

  /// Create a copy of LogicPill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogicPillImplCopyWith<_$LogicPillImpl> get copyWith =>
      __$$LogicPillImplCopyWithImpl<_$LogicPillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogicPillImplToJson(
      this,
    );
  }
}

abstract class _LogicPill implements LogicPill {
  const factory _LogicPill(
      {required final String type,
      required final String question,
      required final List<String> options,
      @JsonKey(name: 'correct_answer') required final String correctAnswer,
      required final String explanation}) = _$LogicPillImpl;

  factory _LogicPill.fromJson(Map<String, dynamic> json) =
      _$LogicPillImpl.fromJson;

  @override
  String get type;
  @override
  String get question;
  @override
  List<String> get options;
  @override
  @JsonKey(name: 'correct_answer')
  String get correctAnswer;
  @override
  String get explanation;

  /// Create a copy of LogicPill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogicPillImplCopyWith<_$LogicPillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
