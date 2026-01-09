// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logic_pill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogicPillImpl _$$LogicPillImplFromJson(Map<String, dynamic> json) =>
    _$LogicPillImpl(
      type: json['type'] as String,
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      correctAnswer: json['correct_answer'] as String,
      explanation: json['explanation'] as String,
    );

Map<String, dynamic> _$$LogicPillImplToJson(_$LogicPillImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'question': instance.question,
      'options': instance.options,
      'correct_answer': instance.correctAnswer,
      'explanation': instance.explanation,
    };
