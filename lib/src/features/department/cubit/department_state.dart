part of 'department_bloc.dart';

class DepartmentState extends Equatable {
  final List<DepartmentModel> list;
  final bool isLoading;
  const DepartmentState({
    required this.list,
    this.isLoading = true,
  });

  factory DepartmentState.ds() => const DepartmentState(
        list: [],
        isLoading: true,
      );

  @override
  List<Object?> get props => [
        list,
        isLoading,
      ];

  DepartmentState copyWith({
    List<DepartmentModel>? list,
    bool? isLoading,
  }) {
    return DepartmentState(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
