import 'dart:convert';

class OtherWorkScheduleModel {
  final int id;
  final String title;
  final String updated;

  OtherWorkScheduleModel({
    required this.id,
    required this.title,
    required this.updated,
  });

  OtherWorkScheduleModel copyWith({
    int? id,
    String? title,
    String? updated,
  }) {
    return OtherWorkScheduleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      updated: updated ?? this.updated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "schedule_id": id,
      "schedule_title": title,
      "updated_date": updated,
    };
  }

  factory OtherWorkScheduleModel.fromMap(Map<String, dynamic> map) {
    return OtherWorkScheduleModel(
      id: map['schedule_id'] == null ? -1 : map['schedule_id'] as int,
      title:
          map['schedule_title'] == null ? "" : map['schedule_title'] as String,
      updated: map['updated_date'] == null ? "" : map['updated_date'] as String,
    );
  }

  factory OtherWorkScheduleModel.empty() {
    return OtherWorkScheduleModel(
      id: -1,
      title: '',
      updated: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherWorkScheduleModel.fromJson(String source) =>
      OtherWorkScheduleModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
