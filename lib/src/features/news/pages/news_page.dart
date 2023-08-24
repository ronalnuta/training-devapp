import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/news/cubit/news_bloc.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/utils.dart';
import 'package:my_app/widgets/common/empty_widget.dart';
import 'package:my_app/widgets/common/indicator.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsBloc(),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Thông báo chung",
                textAlign: TextAlign.center,
              ),
            ),
            body: Column(
              children: [
                _weeklyWidget(),
                const SizedBox(
                  height: 15,
                ),
                state.isLoading
                    ? const XIndicator()
                    : state.list.isEmpty
                        ? const EmptyWidget()
                        : Expanded(
                            child: Scrollbar(
                              controller:
                                  context.read<NewsBloc>().scrollController,
                              child: ListView.builder(
                                controller:
                                    context.read<NewsBloc>().scrollController,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (_, i) {
                                  return i == state.list.length - 1 &&
                                          state.isLoadingMore
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h),
                                          child: const XIndicator(),
                                        )
                                      : InkWell(
                                          onTap: () =>
                                              XCoordinator.showNewsContent(
                                            state.list[i].id,
                                          ),
                                          highlightColor:
                                              XColors.primary.withOpacity(0.15),
                                          splashColor:
                                              XColors.primary.withOpacity(0.3),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                              5.w,
                                              10.h,
                                              25.w,
                                              10.h,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 15.h,
                                                    ),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: XColors.primary,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      width: 12,
                                                      height: 12,
                                                    ),
                                                  ),
                                                ),
                                                GapHelper.w8,
                                                Expanded(
                                                  flex: 9,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        state.list[i].title,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          letterSpacing: -0.41,
                                                          height: 1.5,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                      if (UtilsCalendar
                                                          .formatUpdateDateCalendar(
                                                        state.list[i].updated,
                                                      ).isNotEmpty)
                                                        Text(
                                                          UtilsCalendar
                                                              .formatUpdateDateCalendar(
                                                            state.list[i]
                                                                .updated,
                                                          ),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            letterSpacing:
                                                                -0.41,
                                                            height: 1.5,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                },
                                itemCount: state.list.length,
                              ),
                            ),
                          ),
              ],
            ),
          );
        },
        buildWhen: (p, c) =>
            p.list != c.list ||
            p.isLoading != c.isLoading ||
            p.isLoadingMore != c.isLoadingMore,
      ),
    );
  }

  Widget _weeklyWidget() {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            splashRadius: 20,
            onPressed: () => context.read<NewsBloc>().onPreviousWeek(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                children: [
                  const TextSpan(text: "Tuần\n"),
                  TextSpan(
                    text: state.rangeDaysInWeek,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.7),
                        ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            splashRadius: 20,
            onPressed: () => context.read<NewsBloc>().onNextWeek(),
            icon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ]);
      },
      buildWhen: (p, c) => p.currentWeek != c.currentWeek,
    );
  }
}
