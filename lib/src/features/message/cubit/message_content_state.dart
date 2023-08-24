part of 'message_content_bloc.dart';

class MessageContentState extends Equatable {
  final MessageContentModel? data;
  final bool isLoading;
  final bool isShowMoreDataReceiver;
  const MessageContentState({
    this.data,
    this.isLoading = true,
    this.isShowMoreDataReceiver = false,
  });

  List<String> get listReceiver => data?.receiver.split(';') ?? [];

  factory MessageContentState.ds() =>
      const MessageContentState(data: null, isLoading: true);

  @override
  List<Object?> get props => [
        data,
        isLoading,
        isShowMoreDataReceiver,
      ];

  MessageContentState copyWith({
    MessageContentModel? data,
    bool? isLoading,
    bool? isShowMoreDataReceiver,
  }) {
    return MessageContentState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      isShowMoreDataReceiver:
          isShowMoreDataReceiver ?? this.isShowMoreDataReceiver,
    );
  }
}
