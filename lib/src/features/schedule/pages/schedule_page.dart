import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/features/schedule/cubit/list_schedule_bloc.dart';
import 'package:my_app/src/features/schedule/cubit/manage_calendar_bloc.dart';
import 'package:my_app/src/features/schedule/cubit/schedule_bloc.dart';
import 'package:my_app/src/features/schedule/widgets/list_schedule/list_schedule_view.dart';
import 'package:my_app/src/features/schedule/widgets/weekday_widget.dart';
import 'package:my_app/src/features/schedule/widgets/weekly_widget.dart';
import 'package:my_app/src/features/schedule/widgets/tabbar_widget.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ScheduleBloc(),
        ),
        BlocProvider(
          create: (_) => ManageCalendarBloc(),
        ),
        BlocProvider(
          create: (_) => GetIt.I<ListScheduleBloc>(),
        ),
      ],
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (_, __) {
          final isTeacher = GetIt.I<AccountBloc>().state.isTeacher;
          final titleAppbar =
              isTeacher ? "Lịch giảng dạy/ lịch thi" : 'LỊCH HỌC/ LỊCH THI';

          return Scaffold(
            appBar: AppBar(
              title: Text(
                titleAppbar,
                textAlign: TextAlign.center,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(children: [
                const TabbarWidget(),
                GapHelper.h12,
                const WeeklyWidget(),
                GapHelper.h12,
                const WeekdayWidget(),
                _Divider(),
                GapHelper.h12,
                const ListScheduleView(),
              ]),
            ),
          );
        },
        buildWhen: (p, c) => false,
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 30),
      child: const Divider(thickness: 1, color: XColors.divider),
    );
  }
}
