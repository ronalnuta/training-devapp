import 'dart:convert';

class NewsModel {
  final int id;
  final String title;
  final String updated;

  NewsModel({
    required this.id,
    required this.title,
    required this.updated,
  });

  NewsModel copyWith({
    int? id,
    String? title,
    String? updated,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      updated: updated ?? this.updated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "news_id": id,
      "news_title": title,
      "updated_date": updated,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['news_id'] == null ? -1 : map['news_id'] as int,
      title: map['news_title'] == null ? "" : map['news_title'] as String,
      updated: map['updated_date'] == null ? "" : map['updated_date'] as String,
    );
  }

  factory NewsModel.empty() {
    return NewsModel(
      id: -1,
      title: '',
      updated: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
