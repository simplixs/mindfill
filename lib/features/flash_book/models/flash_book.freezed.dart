// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flash_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlashBook _$FlashBookFromJson(Map<String, dynamic> json) {
  return _FlashBook.fromJson(json);
}

/// @nodoc
mixin _$FlashBook {
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  List<ConceptSlide> get slides => throw _privateConstructorUsedError;
  @JsonKey(name: 'reflection_question')
  String get reflectionQuestion => throw _privateConstructorUsedError;

  /// Serializes this FlashBook to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlashBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashBookCopyWith<FlashBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashBookCopyWith<$Res> {
  factory $FlashBookCopyWith(FlashBook value, $Res Function(FlashBook) then) =
      _$FlashBookCopyWithImpl<$Res, FlashBook>;
  @useResult
  $Res call(
      {String title,
      String author,
      List<ConceptSlide> slides,
      @JsonKey(name: 'reflection_question') String reflectionQuestion});
}

/// @nodoc
class _$FlashBookCopyWithImpl<$Res, $Val extends FlashBook>
    implements $FlashBookCopyWith<$Res> {
  _$FlashBookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlashBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? author = null,
    Object? slides = null,
    Object? reflectionQuestion = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      slides: null == slides
          ? _value.slides
          : slides // ignore: cast_nullable_to_non_nullable
              as List<ConceptSlide>,
      reflectionQuestion: null == reflectionQuestion
          ? _value.reflectionQuestion
          : reflectionQuestion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashBookImplCopyWith<$Res>
    implements $FlashBookCopyWith<$Res> {
  factory _$$FlashBookImplCopyWith(
          _$FlashBookImpl value, $Res Function(_$FlashBookImpl) then) =
      __$$FlashBookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String author,
      List<ConceptSlide> slides,
      @JsonKey(name: 'reflection_question') String reflectionQuestion});
}

/// @nodoc
class __$$FlashBookImplCopyWithImpl<$Res>
    extends _$FlashBookCopyWithImpl<$Res, _$FlashBookImpl>
    implements _$$FlashBookImplCopyWith<$Res> {
  __$$FlashBookImplCopyWithImpl(
      _$FlashBookImpl _value, $Res Function(_$FlashBookImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlashBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? author = null,
    Object? slides = null,
    Object? reflectionQuestion = null,
  }) {
    return _then(_$FlashBookImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      slides: null == slides
          ? _value._slides
          : slides // ignore: cast_nullable_to_non_nullable
              as List<ConceptSlide>,
      reflectionQuestion: null == reflectionQuestion
          ? _value.reflectionQuestion
          : reflectionQuestion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlashBookImpl implements _FlashBook {
  const _$FlashBookImpl(
      {required this.title,
      required this.author,
      required final List<ConceptSlide> slides,
      @JsonKey(name: 'reflection_question') required this.reflectionQuestion})
      : _slides = slides;

  factory _$FlashBookImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashBookImplFromJson(json);

  @override
  final String title;
  @override
  final String author;
  final List<ConceptSlide> _slides;
  @override
  List<ConceptSlide> get slides {
    if (_slides is EqualUnmodifiableListView) return _slides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slides);
  }

  @override
  @JsonKey(name: 'reflection_question')
  final String reflectionQuestion;

  @override
  String toString() {
    return 'FlashBook(title: $title, author: $author, slides: $slides, reflectionQuestion: $reflectionQuestion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashBookImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other._slides, _slides) &&
            (identical(other.reflectionQuestion, reflectionQuestion) ||
                other.reflectionQuestion == reflectionQuestion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, author,
      const DeepCollectionEquality().hash(_slides), reflectionQuestion);

  /// Create a copy of FlashBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashBookImplCopyWith<_$FlashBookImpl> get copyWith =>
      __$$FlashBookImplCopyWithImpl<_$FlashBookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashBookImplToJson(
      this,
    );
  }
}

abstract class _FlashBook implements FlashBook {
  const factory _FlashBook(
      {required final String title,
      required final String author,
      required final List<ConceptSlide> slides,
      @JsonKey(name: 'reflection_question')
      required final String reflectionQuestion}) = _$FlashBookImpl;

  factory _FlashBook.fromJson(Map<String, dynamic> json) =
      _$FlashBookImpl.fromJson;

  @override
  String get title;
  @override
  String get author;
  @override
  List<ConceptSlide> get slides;
  @override
  @JsonKey(name: 'reflection_question')
  String get reflectionQuestion;

  /// Create a copy of FlashBook
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashBookImplCopyWith<_$FlashBookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConceptSlide _$ConceptSlideFromJson(Map<String, dynamic> json) {
  return _ConceptSlide.fromJson(json);
}

/// @nodoc
mixin _$ConceptSlide {
  String get concept => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  /// Serializes this ConceptSlide to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConceptSlide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConceptSlideCopyWith<ConceptSlide> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptSlideCopyWith<$Res> {
  factory $ConceptSlideCopyWith(
          ConceptSlide value, $Res Function(ConceptSlide) then) =
      _$ConceptSlideCopyWithImpl<$Res, ConceptSlide>;
  @useResult
  $Res call({String concept, String body});
}

/// @nodoc
class _$ConceptSlideCopyWithImpl<$Res, $Val extends ConceptSlide>
    implements $ConceptSlideCopyWith<$Res> {
  _$ConceptSlideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConceptSlide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concept = null,
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      concept: null == concept
          ? _value.concept
          : concept // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConceptSlideImplCopyWith<$Res>
    implements $ConceptSlideCopyWith<$Res> {
  factory _$$ConceptSlideImplCopyWith(
          _$ConceptSlideImpl value, $Res Function(_$ConceptSlideImpl) then) =
      __$$ConceptSlideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String concept, String body});
}

/// @nodoc
class __$$ConceptSlideImplCopyWithImpl<$Res>
    extends _$ConceptSlideCopyWithImpl<$Res, _$ConceptSlideImpl>
    implements _$$ConceptSlideImplCopyWith<$Res> {
  __$$ConceptSlideImplCopyWithImpl(
      _$ConceptSlideImpl _value, $Res Function(_$ConceptSlideImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptSlide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concept = null,
    Object? body = null,
  }) {
    return _then(_$ConceptSlideImpl(
      concept: null == concept
          ? _value.concept
          : concept // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConceptSlideImpl implements _ConceptSlide {
  const _$ConceptSlideImpl({required this.concept, required this.body});

  factory _$ConceptSlideImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConceptSlideImplFromJson(json);

  @override
  final String concept;
  @override
  final String body;

  @override
  String toString() {
    return 'ConceptSlide(concept: $concept, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConceptSlideImpl &&
            (identical(other.concept, concept) || other.concept == concept) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concept, body);

  /// Create a copy of ConceptSlide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConceptSlideImplCopyWith<_$ConceptSlideImpl> get copyWith =>
      __$$ConceptSlideImplCopyWithImpl<_$ConceptSlideImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConceptSlideImplToJson(
      this,
    );
  }
}

abstract class _ConceptSlide implements ConceptSlide {
  const factory _ConceptSlide(
      {required final String concept,
      required final String body}) = _$ConceptSlideImpl;

  factory _ConceptSlide.fromJson(Map<String, dynamic> json) =
      _$ConceptSlideImpl.fromJson;

  @override
  String get concept;
  @override
  String get body;

  /// Create a copy of ConceptSlide
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConceptSlideImplCopyWith<_$ConceptSlideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
