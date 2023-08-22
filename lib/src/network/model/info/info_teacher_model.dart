import 'dart:convert';

class InfoTeacherModel {
  final String? personId;
  final String? lastAndMiddleName;
  final String? firstName;
  final String? degreeName;
  final String? academicRankName;
  final String? nation;
  final String? religion;
  final String? position;
  final String? dateOfBirth;
  // IC is identity card
  final String? numberIC;
  final String? dateIssuanceOfIC;
  final String? issuedByIC;
  final String? numberPhone;
  final String? email;
  final String? placeOfBirth;
  final String? currentResidence;
  final String? professionalName;
  final String? departmentName;

  InfoTeacherModel({
    this.personId,
    this.lastAndMiddleName,
    this.firstName,
    this.degreeName,
    this.academicRankName,
    this.nation,
    this.religion,
    this.position,
    this.dateOfBirth,
    this.numberIC,
    this.dateIssuanceOfIC,
    this.issuedByIC,
    this.numberPhone,
    this.email,
    this.placeOfBirth,
    this.currentResidence,
    this.professionalName,
    this.departmentName,
  });

  InfoTeacherModel copyWith({
    String? personId,
    String? lastAndMiddleName,
    String? firstName,
    String? degreeName,
    String? academicRankName,
    String? nation,
    String? religion,
    String? position,
    String? dateOfBirth,
    String? numberIC,
    String? dateIssuanceOfIC,
    String? issuedByIC,
    String? numberPhone,
    String? email,
    String? placeOfBirth,
    String? currentResidence,
    String? professionalName,
    String? departmentName,
  }) {
    return InfoTeacherModel(
      personId: personId ?? this.personId,
      lastAndMiddleName: lastAndMiddleName ?? this.lastAndMiddleName,
      firstName: firstName ?? this.firstName,
      degreeName: degreeName ?? this.degreeName,
      academicRankName: academicRankName ?? this.academicRankName,
      nation: nation ?? this.nation,
      religion: religion ?? this.religion,
      position: position ?? this.position,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      numberIC: numberIC ?? this.numberIC,
      dateIssuanceOfIC: dateIssuanceOfIC ?? this.dateIssuanceOfIC,
      issuedByIC: issuedByIC ?? this.issuedByIC,
      numberPhone: numberPhone ?? this.numberPhone,
      email: email ?? this.email,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      currentResidence: currentResidence ?? this.currentResidence,
      professionalName: professionalName ?? this.professionalName,
      departmentName: departmentName ?? this.departmentName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "MaNhanSu": personId,
      "HoDem": lastAndMiddleName,
      "Ten": firstName,
      "TenHocVi": degreeName,
      "TenHocHam": academicRankName,
      "TenDanToc": nation,
      "TenTonGiao": religion,
      "TenChucVu": position,
      "NgaySinh": dateOfBirth,
      "SoCMND": numberIC,
      "NgayCapCMND": dateIssuanceOfIC,
      "NoiCapCMND": issuedByIC,
      "SoDiDong": numberPhone,
      "Email": email,
      "NoiSinh": placeOfBirth,
      "NoiOHienTai": currentResidence,
      "TenChuyenNganh": professionalName,
      "TenPhongBan": departmentName,
    };
  }

  factory InfoTeacherModel.fromMap(Map<String, dynamic> map) {
    return InfoTeacherModel(
      personId: map['MaNhanSu'] != null ? map['MaNhanSu'] as String : null,
      lastAndMiddleName: map['HoDem'] != null ? map['HoDem'] as String : null,
      firstName: map['Ten'] != null ? map['Ten'] as String : null,
      degreeName: map['TenHocVi'] != null ? map['TenHocVi'] as String : null,
      academicRankName:
          map['TenHocHam'] != null ? map['TenHocHam'] as String : null,
      nation: map['TenDanToc'] != null ? map['TenDanToc'] as String : null,
      religion: map['TenTonGiao'] != null ? map['TenTonGiao'] as String : null,
      position: map['TenChucVu'] != null ? map['TenChucVu'] as String : null,
      dateOfBirth: map['NgaySinh'] != null ? map['NgaySinh'] as String : null,
      numberIC: map['SoCMND'] != null ? map['SoCMND'] as String : null,
      dateIssuanceOfIC:
          map['NgayCapCMND'] != null ? map['NgayCapCMND'] as String : null,
      issuedByIC:
          map['NoiCapCMND'] != null ? map['NoiCapCMND'] as String : null,
      numberPhone: map['SoDiDong'] != null ? map['SoDiDong'] as String : null,
      email: map['Email'] != null ? map['Email'] as String : null,
      placeOfBirth: map['NoiSinh'] != null ? map['NoiSinh'] as String : null,
      currentResidence:
          map['NoiOHienTai'] != null ? map['NoiOHienTai'] as String : null,
      professionalName: map['TenChuyenNganh'] != null
          ? map['TenChuyenNganh'] as String
          : null,
      departmentName:
          map['TenPhongBan'] != null ? map['TenPhongBan'] as String : null,
    );
  }

  factory InfoTeacherModel.empty() {
    return InfoTeacherModel();
  }

  String toJson() => json.encode(toMap());

  factory InfoTeacherModel.fromJson(String source) =>
      InfoTeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
