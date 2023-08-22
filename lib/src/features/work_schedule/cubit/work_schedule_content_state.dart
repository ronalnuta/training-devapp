part of 'work_schedule_content_bloc.dart';

class WorkScheduleContentState extends Equatable {
  final WorkScheduleContentModel? data;
  final bool isLoading;
  const WorkScheduleContentState({this.data, this.isLoading = true});

  factory WorkScheduleContentState.ds() =>
      const WorkScheduleContentState(data: null, isLoading: true);

  @override
  List<Object?> get props => [
        data,
        isLoading,
      ];

  WorkScheduleContentState copyWith({
    WorkScheduleContentModel? data,
    bool? isLoading,
  }) {
    return WorkScheduleContentState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
