part of 'manage_calendar_bloc.dart';

class ManageCalendarState extends Equatable {
  final DateTime currentWeek;
  final DateTime selectedDay;
  const ManageCalendarState({
    required this.currentWeek,
    required this.selectedDay,
  });

  List<DateTime> get daysInWeek => CalendarUtils().getDaysInWeek(currentWeek);

  String get rangeDaysInWeek => CalendarUtils().formatDaysInWeek(daysInWeek);

  String dayText(DateTime day) => CalendarUtils().formatDate(day);

  bool enableDay(int index) => selectedDay.day == daysInWeek[index].day;

  @override
  List<Object?> get props => [
        currentWeek,
        selectedDay,
      ];

  ManageCalendarState copyWith({
    DateTime? currentWeek,
    DateTime? selectedDay,
  }) {
    return ManageCalendarState(
      currentWeek: currentWeek ?? this.currentWeek,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }
}
