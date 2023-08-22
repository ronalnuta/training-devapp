// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'manager_attendance_bloc.dart';

class ManagerAttendanceState extends Equatable {
  final bool isAttendance;
  final List<StudentByCourseModel> list;

  const ManagerAttendanceState({
    this.isAttendance = true,
    this.list = const [],
  });
  @override
  List<Object?> get props => [isAttendance, list];

  ManagerAttendanceState copyWith({
    bool? isAttendance,
    List<StudentByCourseModel>? list,
  }) {
    return ManagerAttendanceState(
      isAttendance: isAttendance ?? this.isAttendance,
      list: list ?? this.list,
    );
  }
}
