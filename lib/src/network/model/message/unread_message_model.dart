import 'dart:convert';

class UnreadMessageModel {
  final int number;

  UnreadMessageModel({
    required this.number,
  });

  UnreadMessageModel copyWith({
    int? number,
  }) {
    return UnreadMessageModel(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'num': number,
    };
  }

  factory UnreadMessageModel.fromMap(Map<String, dynamic> map) {
    return UnreadMessageModel(
      number: map['num'] == null ? -1 : map['num'] as int,
    );
  }
  factory UnreadMessageModel.empty() {
    return UnreadMessageModel(number: 0);
  }

  String toJson() => json.encode(toMap());

  factory UnreadMessageModel.fromJson(String source) =>
      UnreadMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
