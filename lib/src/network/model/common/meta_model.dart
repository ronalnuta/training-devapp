import 'dart:convert';

class MetaModel {
  final int? total;
  final int? pageSize;
  final int? pageNumber;
  final int? totalPage;
  MetaModel({
    this.total,
    this.pageSize,
    this.pageNumber,
    this.totalPage,
  });

  MetaModel copyWith({
    int? total,
    int? pageSize,
    int? pageNumber,
    int? totalPage,
  }) {
    return MetaModel(
      total: total ?? this.total,
      pageSize: pageSize ?? this.pageSize,
      pageNumber: pageNumber ?? this.pageNumber,
      totalPage: totalPage ?? this.totalPage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'page_size': pageSize,
      'page_number': pageNumber,
      'total_page': totalPage,
    };
  }

  factory MetaModel.fromMap(Map<String, dynamic> map) {
    return MetaModel(
      total: map['total'] != null ? map['total'] as int : null,
      pageSize: map['page_size'] != null ? map['page_size'] as int : null,
      pageNumber: map['page_number'] != null ? map['page_number'] as int : null,
      totalPage: map['total_page'] != null ? map['total_page'] as int : null,
    );
  }

  factory MetaModel.empty() {
    return MetaModel();
  }

  String toJson() => json.encode(toMap());

  factory MetaModel.fromJson(String source) =>
      MetaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
