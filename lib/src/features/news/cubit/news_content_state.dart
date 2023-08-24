part of 'news_content_bloc.dart';

class NewsContentState extends Equatable {
  final NewsContentModel? data;
  final bool isLoading;
  const NewsContentState({this.data, this.isLoading = true});

  factory NewsContentState.ds() =>
      const NewsContentState(data: null, isLoading: true);

  @override
  List<Object?> get props => [
        data,
        isLoading,
      ];

  NewsContentState copyWith({
    NewsContentModel? data,
    bool? isLoading,
  }) {
    return NewsContentState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
