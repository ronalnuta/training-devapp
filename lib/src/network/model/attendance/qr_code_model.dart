// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QRCodeModel {
  final String? qrCode;
  QRCodeModel({
    this.qrCode,
  });

  QRCodeModel copyWith({
    String? qrCode,
  }) {
    return QRCodeModel(
      qrCode: qrCode ?? this.qrCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'link_qrcode': qrCode,
    };
  }

  factory QRCodeModel.fromMap(Map<String, dynamic> map) {
    return QRCodeModel(
      qrCode: map['link_qrcode'] != null ? map['link_qrcode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QRCodeModel.fromJson(String source) =>
      QRCodeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QRCodeModel(qrCode: $qrCode)';

  @override
  bool operator ==(covariant QRCodeModel other) {
    if (identical(this, other)) return true;

    return other.qrCode == qrCode;
  }

  @override
  int get hashCode => qrCode.hashCode;
}
