import 'dart:convert';

class InfoStudentModel {
  final String? personId;
  final String? lastAndMiddleName;
  final String? firstName;
  final String? dateOfBirth;
  final String? nation;
  final String? religion;
  final String? placeOfBirth;
  final String? faculty;
  final String? placeOfOrigin;
  final String? permanentAddress;
  final String? contactAddress;
  final String? numberPhone;
  final String? email;
  // IC is identity card
  final String? numberIC;
  final String? dateIssuanceOfIC;
  final String? issuedByIC;
  final String? className;
  final String? educationSystem;
  final String? major;
  final String? statusName;

  InfoStudentModel({
    this.personId,
    this.lastAndMiddleName,
    this.firstName,
    this.dateOfBirth,
    this.nation,
    this.religion,
    this.placeOfBirth,
    this.faculty,
    this.placeOfOrigin,
    this.permanentAddress,
    this.contactAddress,
    this.numberPhone,
    this.email,
    this.numberIC,
    this.dateIssuanceOfIC,
    this.issuedByIC,
    this.className,
    this.educationSystem,
    this.major,
    this.statusName,
  });

  InfoStudentModel copyWith({
    String? personId,
    String? lastAndMiddleName,
    String? firstName,
    String? dateOfBirth,
    String? nation,
    String? religion,
    String? placeOfBirth,
    String? faculty,
    String? placeOfOrigin,
    String? permanentAddress,
    String? contactAddress,
    String? numberPhone,
    String? email,
    String? numberIC,
    String? dateIssuanceOfIC,
    String? issuedByIC,
    String? className,
    String? educationSystem,
    String? major,
    String? statusName,
  }) {
    return InfoStudentModel(
      personId: personId ?? this.personId,
      lastAndMiddleName: lastAndMiddleName ?? this.lastAndMiddleName,
      firstName: firstName ?? this.firstName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      nation: nation ?? this.nation,
      religion: religion ?? this.religion,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      faculty: faculty ?? this.faculty,
      placeOfOrigin: placeOfOrigin ?? this.placeOfOrigin,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      contactAddress: contactAddress ?? this.contactAddress,
      numberPhone: numberPhone ?? this.numberPhone,
      email: email ?? this.email,
      numberIC: numberIC ?? this.numberIC,
      dateIssuanceOfIC: dateIssuanceOfIC ?? this.dateIssuanceOfIC,
      issuedByIC: issuedByIC ?? this.issuedByIC,
      className: className ?? this.className,
      educationSystem: educationSystem ?? this.educationSystem,
      major: major ?? this.major,
      statusName: statusName ?? this.statusName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'MaSinhVien': personId,
      'HoDem': lastAndMiddleName,
      'Ten': firstName,
      'NgaySinh2': dateOfBirth,
      'DanToc': nation,
      'TonGiao': religion,
      'NoiSinh': placeOfBirth,
      'Khoa': faculty,
      'NguyenQuan': placeOfOrigin,
      'DiaChiThuongTru': permanentAddress,
      'DiaChiLienLac': contactAddress,
      'SoDienThoai': numberPhone,
      'Email': email,
      'SoCMND': numberIC,
      'NgayCap': dateIssuanceOfIC,
      'NoiCap': issuedByIC,
      'TenLop': className,
      'TenHeDaoTao': educationSystem,
      'TenNganh': major,
      'TenTrangThai': statusName,
    };
  }

  factory InfoStudentModel.fromMap(Map<String, dynamic> map) {
    return InfoStudentModel(
      personId: map['MaSinhVien'] != null ? map['MaSinhVien'] as String : null,
      lastAndMiddleName: map['HoDem'] != null ? map['HoDem'] as String : null,
      firstName: map['Ten'] != null ? map['Ten'] as String : null,
      dateOfBirth: map['NgaySinh2'] != null ? map['NgaySinh2'] as String : null,
      nation: map['DanToc'] != null ? map['DanToc'] as String : null,
      religion: map['TonGiao'] != null ? map['TonGiao'] as String : null,
      placeOfBirth: map['NoiSinh'] != null ? map['NoiSinh'] as String : null,
      faculty: map['Khoa'] != null ? map['Khoa'] as String : null,
      placeOfOrigin:
          map['NguyenQuan'] != null ? map['NguyenQuan'] as String : null,
      permanentAddress: map['DiaChiThuongTru'] != null
          ? map['DiaChiThuongTru'] as String
          : null,
      contactAddress:
          map['DiaChiLienLac'] != null ? map['DiaChiLienLac'] as String : null,
      numberPhone:
          map['SoDienThoai'] != null ? map['SoDienThoai'] as String : null,
      email: map['Email'] != null ? map['Email'] as String : null,
      numberIC: map['SoCMND'] != null ? map['SoCMND'] as String : null,
      dateIssuanceOfIC:
          map['NgayCap'] != null ? map['NgayCap'] as String : null,
      issuedByIC: map['NoiCap'] != null ? map['NoiCap'] as String : null,
      className: map['TenLop'] != null ? map['TenLop'] as String : null,
      educationSystem:
          map['TenHeDaoTao'] != null ? map['TenHeDaoTao'] as String : null,
      major: map['TenNganh'] != null ? map['TenNganh'] as String : null,
      statusName:
          map['TenTrangThai'] != null ? map['TenTrangThai'] as String : null,
    );
  }

  factory InfoStudentModel.empty() {
    return InfoStudentModel();
  }

  String toJson() => json.encode(toMap());

  factory InfoStudentModel.fromJson(String source) =>
      InfoStudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
