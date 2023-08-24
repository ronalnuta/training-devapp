part of 'other_work_schedule_content_bloc.dart';

class OtherWorkScheduleContentState extends Equatable {
  final OtherWorkScheduleContentModel? data;
  final bool isLoading;
  const OtherWorkScheduleContentState({this.data, this.isLoading = true});

  factory OtherWorkScheduleContentState.ds() =>
      const OtherWorkScheduleContentState(data: null, isLoading: true);

  @override
  List<Object?> get props => [
        data,
        isLoading,
      ];

  OtherWorkScheduleContentState copyWith({
    OtherWorkScheduleContentModel? data,
    bool? isLoading,
  }) {
    return OtherWorkScheduleContentState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
