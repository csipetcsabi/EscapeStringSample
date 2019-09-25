// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) {
  return ContentModel(
    questionOptionId: json['QuestionOptionID'] as int,
    title: json['Title'] as String,
    feedback: json['Feedback'] as String,
    position: json['Position'] as int,
    selectedColor: json['SelectedColour'] as String,
    fkQuestionId: json['FK_QuestionID'] as int,
    isSelected: json['isSelected'] as bool,
  );
}

Map<String, dynamic> _$ContentModelToJson(ContentModel instance) =>
    <String, dynamic>{
      'QuestionOptionID': instance.questionOptionId,
      'Title': instance.title,
      'Feedback': instance.feedback,
      'Position': instance.position,
      'SelectedColour': instance.selectedColor,
      'FK_QuestionID': instance.fkQuestionId,
      'isSelected': instance.isSelected,
    };
