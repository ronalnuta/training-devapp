part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  final PageIndex pageIndex;

  const BottomNavigationState({this.pageIndex = PageIndex.home});

  @override
  List<Object> get props => [
        pageIndex,
      ];

  BottomNavigationState copyWith({
    PageIndex? pageIndex,
  }) {
    return BottomNavigationState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}

enum PageIndex {
  home,
  calendar,
  studentCard,
  profile,
}

extension PageIndexExt on PageIndex {
  String lableOf() {
    switch (this) {
      case PageIndex.home:
        return "Home";
      case PageIndex.calendar:
        return "Calendar";
      case PageIndex.studentCard:
        return "Student Card";
      case PageIndex.profile:
        return "Profile";
      default:
        return '';
    }
  }

  Widget iconOf({bool isActived = false}) {
    switch (this) {
      case PageIndex.home:
        return Image.asset(
          XImage.home,
          width: 30,
          height: 30,
          color: isActived ? XColors.primary : null,
          fit: BoxFit.contain,
        );
      case PageIndex.calendar:
        return Image.asset(
          XImage.calendar,
          width: 30,
          height: 30,
          color: isActived ? XColors.primary : null,
          fit: BoxFit.contain,
        );
      case PageIndex.studentCard:
        return Image.asset(
          XImage.card,
          width: 30,
          height: 30,
          color: isActived ? XColors.primary : null,
          fit: BoxFit.contain,
        );
      case PageIndex.profile:
        return Image.asset(
          XImage.profile,
          width: 30,
          height: 30,
          color: isActived ? XColors.primary : null,
          fit: BoxFit.contain,
        );
      default:
        return const Icon(Icons.emoji_emotions_outlined);
    }
  }

  Widget get page {
    switch (this) {
      case PageIndex.home:
        return const HomeWrapperPage();
      case PageIndex.calendar:
        return const ScheduleWrapperPage();
      case PageIndex.studentCard:
        return const CardStudentWrapperPage();
      case PageIndex.profile:
        return const ProfileWrapperPage();

      default:
        return const EmptyWidget();
    }
  }
}
