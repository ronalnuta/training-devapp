import 'dart:convert';

class MessageContentModel {
  final int id;
  final String title;
  final String content;
  final int senderId;
  final String senderName;
  final String date;
  final List<FileMessageModel> files;
  final String receiver;
  final String position;

  MessageContentModel({
    required this.id,
    required this.title,
    required this.content,
    required this.senderId,
    required this.senderName,
    required this.date,
    required this.files,
    required this.receiver,
    required this.position,
  });

  MessageContentModel copyWith({
    int? id,
    String? title,
    String? content,
    int? senderId,
    String? senderName,
    String? date,
    List<FileMessageModel>? files,
    String? receiver,
    String? position,
  }) {
    return MessageContentModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      date: date ?? this.date,
      files: files ?? this.files,
      receiver: receiver ?? this.receiver,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ma_tin_nhan': id,
      'tieu_de': title,
      'noi_dung': content,
      'ma_nguoi_gui': senderId,
      'ten_nguoi_gui': senderName,
      'thoigian': date,
      'file_kem': files.map((x) => x.toMap()).toList(),
      'nguoi_nhan': receiver,
      'don_vi': position,
    };
  }

  factory MessageContentModel.fromMap(Map<String, dynamic> map) {
    return MessageContentModel(
      id: map['ma_tin_nhan'] == null ? -1 : map['ma_tin_nhan'] as int,
      title: map['tieu_de'] == null ? "" : map['tieu_de'] as String,
      content: map['noi_dung'] == null ? "" : map['noi_dung'] as String,
      senderId: map['ma_nguoi_gui'] == null ? -1 : map['ma_nguoi_gui'] as int,
      senderName:
          map['ten_nguoi_gui'] == null ? "" : map['ten_nguoi_gui'] as String,
      date: map['thoigian'] == null ? "" : map['thoigian'] as String,
      files: map['file_kem'] == null
          ? []
          : List<FileMessageModel>.of(
              (map['file_kem'] as List).map<FileMessageModel>(
                (x) => FileMessageModel.fromMap(x as Map<String, dynamic>),
              ),
            ),
      receiver: map['nguoi_nhan'] == null ? "" : map['nguoi_nhan'] as String,
      position: map['don_vi'] == null ? "" : map['don_vi'] as String,
    );
  }

  factory MessageContentModel.empty() {
    return MessageContentModel(
      id: -1,
      title: '',
      content: '',
      senderId: -1,
      senderName: '',
      date: '',
      files: [],
      receiver: '',
      position: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageContentModel.fromJson(String source) =>
      MessageContentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class FileMessageModel {
  final String link;
  final String fileName;

  FileMessageModel({
    required this.link,
    required this.fileName,
  });

  FileMessageModel copyWith({
    String? link,
    String? fileName,
  }) {
    return FileMessageModel(
      link: link ?? this.link,
      fileName: fileName ?? this.fileName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'link': link,
      'file_name': fileName,
    };
  }

  factory FileMessageModel.fromMap(Map<String, dynamic> map) {
    return FileMessageModel(
      link: map['link'] == null ? "" : map['link'] as String,
      fileName: map['file_name'] == null ? "" : map['file_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileMessageModel.fromJson(String source) =>
      FileMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
