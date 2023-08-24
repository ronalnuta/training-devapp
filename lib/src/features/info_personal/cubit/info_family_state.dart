part of 'info_family_bloc.dart';

class InfoFamilyState extends Equatable {
  final FamilyInclude? family;
  const InfoFamilyState({this.family});

  @override
  List<Object?> get props => [
        family,
      ];

  InfoFamilyState copyWith({
    FamilyInclude? family,
  }) {
    return InfoFamilyState(
      family: family,
    );
  }
}

enum FamilyInclude {
  father,
  mother,
}

extension FamilyIncludeExt on FamilyInclude {
  String get infoOf {
    switch (this) {
      case FamilyInclude.father:
        return "Thông tin cha";
      case FamilyInclude.mother:
        return "Thông tin mẹ";
      default:
        return '';
    }
  }

  String get nameOf {
    switch (this) {
      case FamilyInclude.father:
        return "cha";
      case FamilyInclude.mother:
        return "mẹ";
      default:
        return '';
    }
  }

  Widget get tabOf {
    switch (this) {
      case FamilyInclude.father:
        return const InfoFamilyTab();
      case FamilyInclude.mother:
        return const InfoFamilyTab();

      default:
        return const NotFoundPage();
    }
  }
}
