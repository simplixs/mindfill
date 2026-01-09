import 'package:freezed_annotation/freezed_annotation.dart';

part 'logic_pill.freezed.dart';
part 'logic_pill.g.dart';

@freezed
class LogicPill with _$LogicPill {
  const factory LogicPill({
    required String type,
    required String question,
    required List<String> options,
    @JsonKey(name: 'correct_answer') required String correctAnswer,
    required String explanation,
  }) = _LogicPill;

  factory LogicPill.fromJson(Map<String, dynamic> json) => _$LogicPillFromJson(json);
}
