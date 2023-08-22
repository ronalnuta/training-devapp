part of 'home_bloc.dart';

class HomeState extends Equatable {
  final UnreadMessageModel unreadMessage;
  const HomeState({required this.unreadMessage});

  factory HomeState.ds() =>
      HomeState(unreadMessage: UnreadMessageModel.empty());

  @override
  List<Object?> get props => [
        unreadMessage,
      ];

  HomeState copyWith({
    UnreadMessageModel? unreadMessage,
  }) {
    return HomeState(
      unreadMessage: unreadMessage ?? this.unreadMessage,
    );
  }
}
