part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final bool isShowAll;
  const NotificationState({
    this.isShowAll = true,
  });

  @override
  List<Object?> get props => [
        isShowAll,
      ];

  NotificationState copyWith({
    bool? isShowAll,
  }) {
    return NotificationState(
      isShowAll: isShowAll ?? this.isShowAll,
    );
  }
}
