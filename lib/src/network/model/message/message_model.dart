import 'dart:convert';

class MessageModel {
  final int id;
  final String title;
  final int senderId;
  final String senderName;
  final String date;
  final int status;

  MessageModel({
    required this.id,
    required this.title,
    required this.senderId,
    required this.senderName,
    required this.date,
    required this.status,
  });

  MessageModel copyWith({
    int? id,
    String? title,
    int? senderId,
    String? senderName,
    String? date,
    int? status,
  }) {
    return MessageModel(
      id: id ?? this.id,
      title: title ?? this.title,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ma_tin_nhan': id,
      'tieu_de': title,
      'ma_nguoi_gui': senderId,
      'ten_nguoi_gui': senderName,
      'thoigian': date,
      'tinh_trang': status,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['ma_tin_nhan'] == null ? -1 : map['ma_tin_nhan'] as int,
      title: map['tieu_de'] == null ? "" : map['tieu_de'] as String,
      senderId: map['ma_nguoi_gui'] == null ? -1 : map['ma_nguoi_gui'] as int,
      senderName:
          map['ten_nguoi_gui'] == null ? "" : map['ten_nguoi_gui'] as String,
      date: map['thoigian'] == null ? "" : map['thoigian'] as String,
      status: map['tinh_trang'] == null ? -1 : map['tinh_trang'] as int,
    );
  }

  factory MessageModel.empty() {
    return MessageModel(
      id: -1,
      title: '',
      senderId: -1,
      senderName: '',
      date: '',
      status: -1,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
