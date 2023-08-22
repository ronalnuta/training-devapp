import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/work_schedule/cubit/work_schedule_content_bloc.dart';
import 'package:my_app/widgets/common/empty_widget.dart';
import 'package:my_app/widgets/common/indicator.dart';

class WorkScheduleContentPage extends StatelessWidget {
  final int workScheduleId;
  const WorkScheduleContentPage({super.key, required this.workScheduleId});

  @override
  Widget build(BuildContext context) {
    ScrollController horizontalController = ScrollController();
    ScrollController verticalController = ScrollController();

    return BlocProvider(
      create: (_) => WorkScheduleContentBloc(workScheduleId),
      child: BlocBuilder<WorkScheduleContentBloc, WorkScheduleContentState>(
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Nội dung lịch công tác",
                textAlign: TextAlign.center,
              ),
            ),
            body: state.isLoading
                ? const XIndicator()
                : state.data == null
                    ? const EmptyWidget()
                    : Scrollbar(
                        controller: verticalController,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          controller: verticalController,
                          child: Scrollbar(
                            controller: horizontalController,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              controller: horizontalController,
                              child: Html(
                                data: state.data!.content,
                                customRenders: {
                                  tableMatcher(): tableRender(),
                                },
                                shrinkWrap: true,
                                style: {
                                  "table": Style(
                                    backgroundColor: Colors.white,
                                    width: ScreenUtil().screenWidth * 2,
                                  ),
                                  "tr": Style(
                                    padding: const EdgeInsets.all(2),
                                    border: Border.all(color: Colors.black),
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
                            ),
                          ),
                        ),
                      ),
          );
        },
        buildWhen: (p, c) => p.data != c.data || p.isLoading != c.isLoading,
      ),
    );
  }
}
