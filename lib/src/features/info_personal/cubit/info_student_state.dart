part of 'info_student_bloc.dart';

class InfoStudentState extends Equatable {
  final InfoType info;
  const InfoStudentState({this.info = InfoType.education});

  @override
  List<Object?> get props => [
        info,
      ];

  InfoStudentState copyWith({
    InfoType? info,
  }) {
    return InfoStudentState(
      info: info ?? this.info,
    );
  }
}

enum InfoType {
  education,
  individual,
  family,
}

extension InfoTypeExt on InfoType {
  String get nameOf {
    switch (this) {
      case InfoType.education:
        return "Thông tin học vấn";
      case InfoType.individual:
        return "Thông tin cá nhân";
      case InfoType.family:
        return "Quan hệ gia đình";
      default:
        return '';
    }
  }

  Widget get tabOf {
    switch (this) {
      case InfoType.education:
        return const InfoEducationTab();
      case InfoType.individual:
        return const InfoIndividualTab();
      case InfoType.family:
        return const FamilyRelationshipTab();
      default:
        return const NotFoundPage();
    }
  }
}
