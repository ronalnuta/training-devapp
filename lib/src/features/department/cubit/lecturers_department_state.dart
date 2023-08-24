part of 'lecturers_department_bloc.dart';

class LecturersDepartmentState extends Equatable {
  final List<LecturersDepartmentModel> list;
  final bool isLoading;
  const LecturersDepartmentState({
    required this.list,
    this.isLoading = true,
  });

  factory LecturersDepartmentState.ds() => const LecturersDepartmentState(
        list: [],
        isLoading: true,
      );

  @override
  List<Object?> get props => [
        list,
        isLoading,
      ];

  LecturersDepartmentState copyWith({
    List<LecturersDepartmentModel>? list,
    bool? isLoading,
  }) {
    return LecturersDepartmentState(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
