// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'work_schedule_bloc.dart';

class WorkScheduleState extends Equatable {
  final List<WorkScheduleModel> list;
  final bool isLoading;
  final DateTime currentWeek;
  const WorkScheduleState({
    required this.list,
    this.isLoading = true,
    required this.currentWeek,
  });

  List<DateTime> get daysInWeek => CalendarUtils().getDaysInWeek(currentWeek);

  String get rangeDaysInWeek => CalendarUtils().formatDaysInWeek(daysInWeek);

  String dayText(DateTime day) => CalendarUtils().formatDate(day);

  factory WorkScheduleState.ds() => WorkScheduleState(
      list: const [], isLoading: true, currentWeek: DateTime.now());

  @override
  List<Object?> get props => [
        list,
        isLoading,
        currentWeek,
      ];

  WorkScheduleState copyWith({
    List<WorkScheduleModel>? list,
    bool? isLoading,
    DateTime? currentWeek,
  }) {
    return WorkScheduleState(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
      currentWeek: currentWeek ?? this.currentWeek,
    );
  }
}
