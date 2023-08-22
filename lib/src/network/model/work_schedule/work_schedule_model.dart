import 'dart:convert';

class WorkScheduleModel {
  final int id;
  final String title;
  final String updated;

  WorkScheduleModel({
    required this.id,
    required this.title,
    required this.updated,
  });

  WorkScheduleModel copyWith({
    int? id,
    String? title,
    String? updated,
  }) {
    return WorkScheduleModel(
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

  factory WorkScheduleModel.fromMap(Map<String, dynamic> map) {
    return WorkScheduleModel(
      id: map['schedule_id'] == null ? -1 : map['schedule_id'] as int,
      title:
          map['schedule_title'] == null ? "" : map['schedule_title'] as String,
      updated: map['updated_date'] == null ? "" : map['updated_date'] as String,
    );
  }

  factory WorkScheduleModel.empty() {
    return WorkScheduleModel(
      id: -1,
      title: '',
      updated: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkScheduleModel.fromJson(String source) =>
      WorkScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
