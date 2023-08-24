import 'package:my_app/src/network/model/common/meta_model.dart';

class BaseModel<T> {
  bool success;
  int statusCode;
  MetaModel? meta;
  T data;
  String? message;

  BaseModel({
    required this.success,
    required this.statusCode,
    this.meta,
    required this.data,
    this.message,
  });

  BaseModel<T> copyWith({
    bool? success,
    int? statusCode,
    MetaModel? meta,
    T? data,
    String? message,
  }) {
    return BaseModel<T>(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      meta: meta ?? this.meta,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap(Map<String, dynamic> Function(T) toJson) {
    return <String, dynamic>{
      'success': success,
      'status_code': statusCode,
      'meta': meta?.toMap(),
      'data': toJson(data),
      'message': message,
    };
  }

  factory BaseModel.empty(T data) {
    return BaseModel(
      success: false,
      statusCode: -1,
      data: data,
    );
  }

  factory BaseModel.fromMap(
    Map<String, dynamic> map, [
    T Function(Map<String, dynamic>)? fromMap,
  ]) {
    return BaseModel<T>(
      success: map['success'] as bool,
      statusCode: map['status_code'] as int,
      meta: map['meta'] != null
          ? MetaModel.fromMap(map['meta'] as Map<String, dynamic>)
          : null,
      data: fromMap != null
          ? fromMap(map['data'] as Map<String, dynamic>)
          : {} as T,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }
}
