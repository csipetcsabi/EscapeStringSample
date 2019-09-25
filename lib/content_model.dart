import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_model.g.dart';

@JsonSerializable(nullable: false)
class ContentModel extends Equatable {

  @JsonKey(name: "QuestionOptionID") final int questionOptionId;
  @JsonKey(name: "Title") final String title;
  @JsonKey(name: "Feedback") final String feedback;
  @JsonKey(name: "Position") final int position;
  @JsonKey(name: "SelectedColour") final String selectedColor;
  @JsonKey(name: "FK_QuestionID") final int fkQuestionId;
  final bool isSelected;

  ContentModel({
    this.questionOptionId,
    this.title,
    this.feedback,
    this.position,
    this.selectedColor,
    this.fkQuestionId,
    this.isSelected = false
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) => _$ContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContentModelToJson(this);

  @override
  String toString() => this.props.toString();

  ContentModel copyWith({
      int questionOptionId,
      String title,
      String feedback,
      int position,
      String selectedColor,
      int fkQuestionId,
      bool isSelected
    }) {
    return ContentModel(
      questionOptionId: questionOptionId ?? this.questionOptionId,
      title: title ?? this.title,
      feedback: feedback ?? this.feedback,
      position: position ?? this.position,
      selectedColor: selectedColor ?? this.selectedColor,
      fkQuestionId: fkQuestionId ?? this.fkQuestionId,
      isSelected: isSelected ?? this.isSelected
    );
  }

  String transformHtml(String val) => val.replaceAll("\\n", "\n");
}