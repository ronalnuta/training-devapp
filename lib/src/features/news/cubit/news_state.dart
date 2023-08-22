// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_bloc.dart';

class NewsState extends Equatable {
  final List<NewsModel> list;
  final MetaModel? meta;
  final int numberPage;
  final bool isLoading;
  final bool isLoadingMore;
  final DateTime currentWeek;

  const NewsState({
    required this.list,
    this.isLoading = true,
    this.numberPage = 1,
    this.isLoadingMore = false,
    required this.meta,
    required this.currentWeek,
  });

  List<DateTime> get daysInWeek => CalendarUtils().getDaysInWeek(currentWeek);

  String get rangeDaysInWeek => CalendarUtils().formatDaysInWeek(daysInWeek);

  String dayText(DateTime day) => CalendarUtils().formatDate(day);

  factory NewsState.ds() => NewsState(
        list: const [],
        isLoading: true,
        numberPage: 1,
        isLoadingMore: false,
        meta: MetaModel.empty(),
        currentWeek: DateTime.now(),
      );

  @override
  List<Object?> get props => [
        list,
        isLoading,
        numberPage,
        isLoadingMore,
        meta,
        currentWeek,
      ];

  NewsState copyWith({
    List<NewsModel>? list,
    MetaModel? meta,
    int? numberPage,
    bool? isLoading,
    bool? isLoadingMore,
    DateTime? currentWeek,
  }) {
    return NewsState(
        list: list ?? this.list,
        isLoading: isLoading ?? this.isLoading,
        numberPage: numberPage ?? this.numberPage,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        meta: meta ?? this.meta,
        currentWeek: currentWeek ?? this.currentWeek);
  }
}
