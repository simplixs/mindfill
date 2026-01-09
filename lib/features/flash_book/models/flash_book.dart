import 'package:freezed_annotation/freezed_annotation.dart';

part 'flash_book.freezed.dart';
part 'flash_book.g.dart';

@freezed
class FlashBook with _$FlashBook {
  const factory FlashBook({
    required String title,
    required String author,
    required List<ConceptSlide> slides,
    @JsonKey(name: 'reflection_question') required String reflectionQuestion,
  }) = _FlashBook;

  factory FlashBook.fromJson(Map<String, dynamic> json) => _$FlashBookFromJson(json);
}

@freezed
class ConceptSlide with _$ConceptSlide {
  const factory ConceptSlide({
    required String concept,
    required String body,
  }) = _ConceptSlide;

  factory ConceptSlide.fromJson(Map<String, dynamic> json) => _$ConceptSlideFromJson(json);
}
