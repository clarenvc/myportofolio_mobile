import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// Portfolio skill synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Skill {
  const Skill({
    this.id,
    required this.toolName,
    required this.categoryTitle,
    required this.description,
    this.toolLogoUrl = '',
    this.subSkills = '',
  });

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String toolName;
  final String categoryTitle;
  final String description;

  @JsonKey(defaultValue: '')
  final String toolLogoUrl;

  @JsonKey(defaultValue: '')
  final String subSkills;

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
