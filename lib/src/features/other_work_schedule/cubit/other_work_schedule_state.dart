part of 'other_work_schedule_bloc.dart';

class OtherWorkScheduleState extends Equatable {
  final List<OtherWorkScheduleModel> list;
  final bool isLoading;
  const OtherWorkScheduleState({required this.list, this.isLoading = true});

  factory OtherWorkScheduleState.ds() =>
      const OtherWorkScheduleState(list: [], isLoading: true);

  @override
  List<Object?> get props => [
        list,
        isLoading,
      ];

  OtherWorkScheduleState copyWith({
    List<OtherWorkScheduleModel>? list,
    bool? isLoading,
  }) {
    return OtherWorkScheduleState(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
