part of 'lecturers_bloc.dart';

class LecturersState extends Equatable {
  final LecturersDepartmentModel data;
  final bool isLoading;
  const LecturersState({
    required this.data,
    this.isLoading = true,
  });

  factory LecturersState.ds() => LecturersState(
        data: LecturersDepartmentModel.empty(),
        isLoading: true,
      );

  @override
  List<Object?> get props => [
        data,
        isLoading,
      ];

  LecturersState copyWith({
    LecturersDepartmentModel? data,
    bool? isLoading,
  }) {
    return LecturersState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
