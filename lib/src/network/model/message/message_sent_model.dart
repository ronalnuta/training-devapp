import 'dart:convert';

class MessageSentModel {
  final int id;
  final String title;
  final String senderName;
  final String date;

  MessageSentModel({
    required this.id,
    required this.title,
    required this.senderName,
    required this.date,
  });

  MessageSentModel copyWith({
    int? id,
    String? title,
    String? senderName,
    String? date,
  }) {
    return MessageSentModel(
      id: id ?? this.id,
      title: title ?? this.title,
      senderName: senderName ?? this.senderName,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ma_tin_nhan': id,
      'tieu_de': title,
      'nguoi_nhan': senderName,
      'thoigian': date,
    };
  }

  factory MessageSentModel.fromMap(Map<String, dynamic> map) {
    return MessageSentModel(
      id: map['ma_tin_nhan'] == null ? -1 : map['ma_tin_nhan'] as int,
      title: map['tieu_de'] == null ? "" : map['tieu_de'] as String,
      senderName: map['nguoi_nhan'] == null ? "" : map['nguoi_nhan'] as String,
      date: map['thoigian'] == null ? "" : map['thoigian'] as String,
    );
  }

  factory MessageSentModel.empty() {
    return MessageSentModel(
      id: -1,
      title: '',
      senderName: '',
      date: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageSentModel.fromJson(String source) =>
      MessageSentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
