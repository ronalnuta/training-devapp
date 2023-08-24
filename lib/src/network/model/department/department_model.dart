import 'dart:convert';

class DepartmentModel {
  final int id;
  final String name;

  DepartmentModel({
    required this.id,
    required this.name,
  });

  DepartmentModel copyWith({
    int? id,
    String? name,
  }) {
    return DepartmentModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "ma_don_vi": id,
      "ten_don_vi": name,
    };
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> map) {
    return DepartmentModel(
      id: map['ma_don_vi'] == null ? -1 : map['ma_don_vi'] as int,
      name: map['ten_don_vi'] == null ? "" : map['ten_don_vi'] as String,
    );
  }

  factory DepartmentModel.empty() {
    return DepartmentModel(
      id: -1,
      name: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DepartmentModel.fromJson(String source) =>
      DepartmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
