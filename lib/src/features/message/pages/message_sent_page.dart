import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/message/cubit/message_sent_bloc.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';
import 'package:my_app/src/utils/utils.dart';
import 'package:my_app/widgets/common/empty_widget.dart';
import 'package:my_app/widgets/common/indicator.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

class MessageSentPage extends StatelessWidget {
  const MessageSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MessageSentBloc(),
      child: BlocBuilder<MessageSentBloc, MessageSentState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Hộp thư / SMS đã gửi",
                textAlign: TextAlign.center,
              ),
            ),
            body: state.isLoading
                ? const XIndicator()
                : state.list.isEmpty
                    ? const EmptyWidget()
                    : Column(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () =>
                                    context.read<MessageSentBloc>().onTap(true),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  elevation: state.isShowAll ? 8 : 0,
                                  foregroundColor: state.isShowAll
                                      ? Colors.white
                                      : XColors.primary,
                                  backgroundColor: state.isShowAll
                                      ? XColors.primary
                                      : Colors.white,
                                  shadowColor:
                                      XColors.primary.withOpacity(0.25),
                                  fixedSize: Size(165.w, 32.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderHelper.r30,
                                  ),
                                ),
                                child: Text(
                                  'Hộp thư đã gửi',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: state.isShowAll
                                            ? Colors.white
                                            : XColors.primary,
                                        letterSpacing: -0.41,
                                        height: 1.5,
                                        fontSize: 18,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => onPressed(),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  elevation: !state.isShowAll ? 8 : 0,
                                  foregroundColor: !state.isShowAll
                                      ? Colors.white
                                      : XColors.primary,
                                  backgroundColor: !state.isShowAll
                                      ? XColors.primary
                                      : Colors.white,
                                  shadowColor:
                                      XColors.primary.withOpacity(0.25),
                                  fixedSize: Size(165.w, 32.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderHelper.r30,
                                  ),
                                ),
                                child: Text(
                                  'SMS đã gửi',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: !state.isShowAll
                                            ? Colors.white
                                            : XColors.primary,
                                        letterSpacing: -0.41,
                                        height: 1.5,
                                        fontSize: 18,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        GapHelper.h20,
                        Expanded(
                          child: Scrollbar(
                            controller: context
                                .read<MessageSentBloc>()
                                .scrollController,
                            child: ListView.builder(
                              controller: context
                                  .read<MessageSentBloc>()
                                  .scrollController,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (_, i) {
                                return i == state.list.length - 1 &&
                                        state.isLoadingMore
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.h,
                                        ),
                                        child: const XIndicator(),
                                      )
                                    : InkWell(
                                        onTap: () =>
                                            XCoordinator.showMessageContent(
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
                                            5.w,
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
                                                flex: 8,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                    if (state.list[i].senderName
                                                        .isNotEmpty)
                                                      Text(
                                                        state
                                                            .list[i].senderName,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          letterSpacing: -0.41,
                                                          height: 1.5,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: AutoSizeText(
                                                  UtilsCalendar
                                                      .formatDateMessage(
                                                    state.list[i].date,
                                                  ),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: -0.41,
                                                    height: 1.5,
                                                  ),
                                                  minFontSize: 10,
                                                  maxFontSize: 13,
                                                  textAlign: TextAlign.end,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
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
                      ]),
          );
        },
        buildWhen: (p, c) =>
            p.list != c.list ||
            p.isLoading != c.isLoading ||
            p.isLoadingMore != c.isLoadingMore ||
            p.isShowAll != c.isShowAll,
      ),
    );
  }

  void onPressed() {
    XToast.show(
        "Chức năng đang được phát triển. Sẽ có sẵn trong phiên bản tiếp theo");
  }
}
