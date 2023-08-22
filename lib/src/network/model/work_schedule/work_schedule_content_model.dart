import 'dart:convert';

class WorkScheduleContentModel {
  final String content;

  WorkScheduleContentModel({
    required this.content,
  });

  WorkScheduleContentModel copyWith({
    String? content,
  }) {
    return WorkScheduleContentModel(
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schedule_content': content,
    };
  }

  factory WorkScheduleContentModel.fromMap(Map<String, dynamic> map) {
    return WorkScheduleContentModel(
      content: map['schedule_content'] == null
          ? ""
          : map['schedule_content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkScheduleContentModel.fromJson(String source) =>
      WorkScheduleContentModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
