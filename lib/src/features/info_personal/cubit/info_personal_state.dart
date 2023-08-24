part of 'info_personal_bloc.dart';

class InfoPersonalState extends Equatable {
  final InfoTeacherModel infoTeacher;
  final InfoStudentModel infoStudent;
  final bool isLoading;

  const InfoPersonalState({
    required this.infoTeacher,
    required this.infoStudent,
    this.isLoading = true,
  });

  factory InfoPersonalState.ds() => InfoPersonalState(
        infoTeacher: InfoTeacherModel.empty(),
        infoStudent: InfoStudentModel.empty(),
      );

  @override
  List<Object?> get props => [
        infoTeacher,
        infoStudent,
        isLoading,
      ];

  InfoPersonalState copyWith({
    InfoTeacherModel? infoTeacher,
    InfoStudentModel? infoStudent,
    bool? isLoading,
  }) {
    return InfoPersonalState(
      infoTeacher: infoTeacher ?? this.infoTeacher,
      infoStudent: infoStudent ?? this.infoStudent,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
