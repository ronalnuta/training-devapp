import 'dart:convert';

import 'package:my_app/src/network/model/login/account_type_enum.dart';

class InfoAccountModel {
  final String username;
  final String? lastAndMiddleName;
  final String? firstName;
  final AccountType type;

  InfoAccountModel({
    required this.username,
    this.lastAndMiddleName,
    this.firstName,
    required this.type,
  });

  InfoAccountModel copyWith({
    String? username,
    String? lastAndMiddleName,
    String? firstName,
    AccountType? type,
  }) {
    return InfoAccountModel(
      username: username ?? this.username,
      lastAndMiddleName: lastAndMiddleName ?? this.lastAndMiddleName,
      firstName: firstName ?? this.firstName,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "Username": username,
      "HoDem": lastAndMiddleName,
      "Ten": firstName,
      "type": type.nameOf,
    };
  }

  factory InfoAccountModel.fromMap(Map<String, dynamic> map) {
    return InfoAccountModel(
      username: map['Username'] == null ? "" : map['Username'] as String,
      lastAndMiddleName: map['HoDem'] == null ? null : map['HoDem'] as String,
      firstName: map['Ten'] == null ? null : map['Ten'] as String,
      type: AccountType.fromString(map['type'] as String),
    );
  }

  factory InfoAccountModel.empty() {
    return InfoAccountModel(
      username: '',
      lastAndMiddleName: null,
      firstName: null,
      type: AccountType.student,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoAccountModel.fromJson(String source) =>
      InfoAccountModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
