import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/message/cubit/message_bloc.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';
import 'package:my_app/src/utils/utils.dart';
import 'package:my_app/widgets/common/empty_widget.dart';
import 'package:my_app/widgets/common/indicator.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MessageBloc(),
      child: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Hộp thư đến", textAlign: TextAlign.center),
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
                                    context.read<MessageBloc>().onTap(true),
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
                                  'Tất cả',
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
                                  'Chưa đọc',
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
                            controller:
                                context.read<MessageBloc>().scrollController,
                            child: ListView.builder(
                              controller:
                                  context.read<MessageBloc>().scrollController,
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
                                                    decoration: BoxDecoration(
                                                      color: state.list[i]
                                                                  .status ==
                                                              0
                                                          ? XColors.primary
                                                          : Colors.white,
                                                      border: Border.all(
                                                        color: state.list[i]
                                                                    .status ==
                                                                0
                                                            ? Colors.white
                                                            : XColors.primary,
                                                        width: state.list[i]
                                                                    .status ==
                                                                0
                                                            ? 0
                                                            : 2,
                                                        style:
                                                            BorderStyle.solid,
                                                      ),
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
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: state
                                                                    .list[i]
                                                                    .status ==
                                                                0
                                                            ? FontWeight.w700
                                                            : FontWeight.w400,
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
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight: state
                                                                      .list[i]
                                                                      .status ==
                                                                  0
                                                              ? FontWeight.w700
                                                              : FontWeight.w400,
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
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        state.list[i].status ==
                                                                0
                                                            ? FontWeight.w700
                                                            : FontWeight.w400,
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
