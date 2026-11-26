import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

/// Portfolio education entry synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Education {
  const Education({
    this.id,
    required this.schoolName,
    required this.startYear,
    required this.endYear,
    required this.description,
    this.starCount = 0,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String schoolName;
  final int startYear;
  final String endYear;
  final String description;

  @JsonKey(defaultValue: 0, includeToJson: false)
  final int starCount;

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
