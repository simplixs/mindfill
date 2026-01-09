// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashBookImpl _$$FlashBookImplFromJson(Map<String, dynamic> json) =>
    _$FlashBookImpl(
      title: json['title'] as String,
      author: json['author'] as String,
      slides: (json['slides'] as List<dynamic>)
          .map((e) => ConceptSlide.fromJson(e as Map<String, dynamic>))
          .toList(),
      reflectionQuestion: json['reflection_question'] as String,
    );

Map<String, dynamic> _$$FlashBookImplToJson(_$FlashBookImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'slides': instance.slides,
      'reflection_question': instance.reflectionQuestion,
    };

_$ConceptSlideImpl _$$ConceptSlideImplFromJson(Map<String, dynamic> json) =>
    _$ConceptSlideImpl(
      concept: json['concept'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$$ConceptSlideImplToJson(_$ConceptSlideImpl instance) =>
    <String, dynamic>{
      'concept': instance.concept,
      'body': instance.body,
    };
