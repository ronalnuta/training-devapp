import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_app/src/features/message/cubit/message_content_bloc.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';
import 'package:my_app/widgets/common/empty_widget.dart';
import 'package:my_app/widgets/common/indicator.dart';

class MessageContentPage extends StatelessWidget {
  final int messageId;
  const MessageContentPage({super.key, required this.messageId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MessageContentBloc(messageId),
      child: BlocBuilder<MessageContentBloc, MessageContentState>(
        builder: (context, state) {
          final hasFiles = state.data?.files.isNotEmpty == true;

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Nội dung tin nhắn",
                textAlign: TextAlign.center,
              ),
            ),
            body: state.isLoading
                ? const XIndicator()
                : state.data == null
                    ? const EmptyWidget()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 30.w,
                        ),
                        child: ListView(children: [
                          Text(
                            state.data!.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.41,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          GapHelper.h24,
                          Text(
                            state.data!.senderName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.41,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          GapHelper.h8,
                          Text(
                            "lúc ${state.data!.date}",
                            style: const TextStyle(
                              color: XColors.borderDot,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.41,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          GapHelper.h8,
                          Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Text(
                                  state.data!.receiver,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.41,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const Spacer(),
                              if (state.data!.receiver.isNotEmpty)
                                GestureDetector(
                                  onTap: () => context
                                      .read<MessageContentBloc>()
                                      .onChangedIconExpanded(),
                                  child: Icon(
                                    state.isShowMoreDataReceiver
                                        ? Icons.keyboard_arrow_up_rounded
                                        : Icons.keyboard_arrow_down_outlined,
                                    color: XColors.diableButton,
                                  ),
                                ),
                            ],
                          ),
                          if (state.isShowMoreDataReceiver) ...[
                            GapHelper.h20,
                            _BoxItem(
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: state.listReceiver
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                              color: XColors.borderDot,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.41,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                          GapHelper.h20,
                          SingleChildScrollView(
                            child: Column(children: [
                              Html(
                                data: state.data!.content,
                                customRenders: {
                                  tableMatcher(): tableRender(),
                                  networkSourceMatcher(): networkImageRender(
                                    headers: {
                                      "Custom-Header": "some-value",
                                    },
                                    altWidget: (alt) => Text(alt ?? ""),
                                    loadingWidget: () => const SpinKitWave(
                                      color: XColors.primary,
                                      size: 30.0,
                                    ),
                                  ),
                                },
                                shrinkWrap: true,
                                style: {
                                  "table": Style(
                                    backgroundColor: Colors.white,
                                  ),
                                  "tr": Style(
                                    padding: const EdgeInsets.all(2),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  "th": Style(
                                    padding: const EdgeInsets.all(2),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  "td": Style(
                                    padding: const EdgeInsets.all(2),
                                    border: Border.all(color: Colors.black),
                                  ),
                                },
                              ),
                            ]),
                          ),
                          if (hasFiles) GapHelper.h20,
                          if (hasFiles)
                            _BoxItem(
                              widget: ListView(
                                shrinkWrap: true,
                                children: state.data!.files
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state
                                                    .data!.files.first.fileName,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: -0.41,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                              GapHelper.h16,
                                              RichText(
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: -0.41,
                                                  ),
                                                  children: [
                                                    const TextSpan(
                                                      text: "Link: ",
                                                    ),
                                                    TextSpan(
                                                      text: state.data!.files
                                                          .first.link,
                                                      style: const TextStyle(
                                                        color: XColors.link,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          //TODO: feature not complited
                          // GapHelper.h36,
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     _buildItemBottomBar("Trả lời", () {}),
                          //     _buildItemBottomBar("Trả lời tất cả", () {}),
                          //     _buildItemBottomBar("Chuyển tiếp", () {})
                          //   ],
                          // ),
                        ]),
                      ),
          );
        },
        buildWhen: (p, c) =>
            p.data != c.data ||
            p.isLoading != c.isLoading ||
            p.isShowMoreDataReceiver != c.isShowMoreDataReceiver,
      ),
    );
  }

  //TODO: feature not complited
//   Widget _buildItemBottomBar(String text, VoidCallback? onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: XColors.orange, width: 1.31),
//           borderRadius: BorderHelper.r20,
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: XColors.orange,
//             fontSize: 12,
//             fontWeight: FontWeight.w700,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
}

class _BoxItem extends StatelessWidget {
  final Widget? widget;
  const _BoxItem({
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: XColors.diableButton, width: 1),
        borderRadius: BorderHelper.r30,
      ),
      width: ScreenUtil().screenWidth,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget != null) widget!,
      ]),
    );
  }
}
