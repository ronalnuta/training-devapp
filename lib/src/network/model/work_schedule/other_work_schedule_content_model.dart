import 'dart:convert';

class OtherWorkScheduleContentModel {
  final String content;

  OtherWorkScheduleContentModel({
    required this.content,
  });

  OtherWorkScheduleContentModel copyWith({
    String? content,
  }) {
    return OtherWorkScheduleContentModel(
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schedule_content': content,
    };
  }

  factory OtherWorkScheduleContentModel.fromMap(Map<String, dynamic> map) {
    return OtherWorkScheduleContentModel(
      content: map['schedule_content'] == null
          ? ""
          : map['schedule_content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherWorkScheduleContentModel.fromJson(String source) =>
      OtherWorkScheduleContentModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
