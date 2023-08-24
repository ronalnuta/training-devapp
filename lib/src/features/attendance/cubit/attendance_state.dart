// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'attendance_bloc.dart';

class AttendanceState extends Equatable {
  final String qrCode;
  final List<StudentByCourseModel> list;

  const AttendanceState({
    this.qrCode = "",
    this.list = const [],
  });
  @override
  List<Object?> get props => [qrCode, list];

  AttendanceState copyWith({
    String? qrCode,
    List<StudentByCourseModel>? list,
  }) {
    return AttendanceState(
      qrCode: qrCode ?? this.qrCode,
      list: list ?? this.list,
    );
  }
}
