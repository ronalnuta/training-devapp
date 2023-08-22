part of 'message_sent_bloc.dart';

class MessageSentState extends Equatable {
  final List<MessageSentModel> list;
  final MetaModel? meta;
  final int pageNumber;
  final bool isLoading;
  final bool isLoadingMore;
  final bool isShowAll;
  const MessageSentState({
    required this.list,
    this.isLoading = true,
    this.pageNumber = 1,
    this.isLoadingMore = false,
    required this.meta,
    this.isShowAll = true,
  });

  factory MessageSentState.ds() => MessageSentState(
        list: const [],
        isLoading: true,
        pageNumber: 1,
        isLoadingMore: false,
        meta: MetaModel.empty(),
        isShowAll: true,
      );

  @override
  List<Object?> get props => [
        list,
        isLoading,
        pageNumber,
        isLoadingMore,
        meta,
        isShowAll,
      ];

  MessageSentState copyWith({
    List<MessageSentModel>? list,
    bool? isLoading,
    int? pageNumber,
    bool? isLoadingMore,
    MetaModel? meta,
    bool? isShowAll,
  }) {
    return MessageSentState(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
      pageNumber: pageNumber ?? this.pageNumber,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      meta: meta ?? this.meta,
      isShowAll: isShowAll ?? this.isShowAll,
    );
  }
}
