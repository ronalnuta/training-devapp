import 'dart:convert';

class NewsContentModel {
  final String content;

  NewsContentModel({
    required this.content,
  });

  NewsContentModel copyWith({
    String? content,
  }) {
    return NewsContentModel(
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'news_content': content,
    };
  }

  factory NewsContentModel.fromMap(Map<String, dynamic> map) {
    return NewsContentModel(
      content: map['news_content'] == null ? "" : map['news_content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsContentModel.fromJson(String source) =>
      NewsContentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
