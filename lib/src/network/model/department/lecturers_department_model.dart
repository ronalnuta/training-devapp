import 'dart:convert';

class LecturersDepartmentModel {
  final int id;
  final String name;
  final String workEmail;
  final String personalEmail;
  final String workPhone;
  final String personalPhone;
  final String position;
  final int order;

  LecturersDepartmentModel({
    required this.id,
    required this.name,
    required this.workEmail,
    required this.personalEmail,
    required this.workPhone,
    required this.personalPhone,
    required this.position,
    required this.order,
  });

  LecturersDepartmentModel copyWith({
    int? id,
    String? name,
    String? workEmail,
    String? personalEmail,
    String? workPhone,
    String? personalPhone,
    String? position,
    int? order,
  }) {
    return LecturersDepartmentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      workEmail: workEmail ?? this.workEmail,
      personalEmail: personalEmail ?? this.personalEmail,
      workPhone: workPhone ?? this.workPhone,
      personalPhone: personalPhone ?? this.personalPhone,
      position: position ?? this.position,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "ma_nguoi_dung": id,
      "ten_nguoi_dung": name,
      "email_ca_nhan": workEmail,
      "email_co_quan": personalEmail,
      "sdt_di_dong": personalPhone,
      "sdt_co_quan": workPhone,
      "chuc_vu": position,
      "order": order,
    };
  }

  factory LecturersDepartmentModel.fromMap(Map<String, dynamic> map) {
    return LecturersDepartmentModel(
      id: map['ma_nguoi_dung'] == null ? -1 : map['ma_nguoi_dung'] as int,
      name:
          map['ten_nguoi_dung'] == null ? "" : map['ten_nguoi_dung'] as String,
      workEmail:
          map['email_co_quan'] == null ? "" : map['email_co_quan'] as String,
      personalEmail:
          map['email_ca_nhan'] == null ? "" : map['email_ca_nhan'] as String,
      workPhone: map['sdt_co_quan'] == null ? "" : map['sdt_co_quan'] as String,
      personalPhone:
          map['sdt_di_dong'] == null ? "" : map['sdt_di_dong'] as String,
      position: map['chuc_vu'] == null ? "" : map['chuc_vu'] as String,
      order: map['order'] == null ? -1 : map['order'] as int,
    );
  }

  factory LecturersDepartmentModel.empty() {
    return LecturersDepartmentModel(
      id: -1,
      name: '',
      workEmail: '',
      personalEmail: '',
      workPhone: '',
      personalPhone: '',
      position: '',
      order: -1,
    );
  }

  String toJson() => json.encode(toMap());

  factory LecturersDepartmentModel.fromJson(String source) =>
      LecturersDepartmentModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
