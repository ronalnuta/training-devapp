part of 'list_schedule_bloc.dart';

class ListScheduleState extends Equatable {
  final bool isEmpty;
  const ListScheduleState({this.isEmpty = false});

  @override
  List<Object?> get props => [
        isEmpty,
      ];

  ListScheduleState copyWith({
    bool? isEmpty,
  }) {
    return ListScheduleState(
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }
}
