import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/schedule/cubit/manage_calendar_bloc.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/radius.dart';

class WeekdayWidget extends StatelessWidget {
  const WeekdayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageCalendarBloc, ManageCalendarState>(
      builder: (_, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            state.daysInWeek.length,
            (i) => _buildDayItem(i),
          ).toList(),
        );
      },
      buildWhen: (p, c) => p.daysInWeek != c.daysInWeek,
    );
  }

  Widget _buildDayItem(int index) {
    final size = Size(40.w, 63.h);

    return BlocBuilder<ManageCalendarBloc, ManageCalendarState>(
      //TODO(levi) : add Buildwhen
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () =>
              context.read<ManageCalendarBloc>().onPressedDay(index),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            elevation: state.enableDay(index) ? 5 : 0,
            foregroundColor:
                state.enableDay(index) ? Colors.white : XColors.primary2,
            backgroundColor:
                state.enableDay(index) ? XColors.primary2 : Colors.transparent,
            shadowColor: Colors.black,
            fixedSize: size,
            maximumSize: size,
            minimumSize: size,
            shape: RoundedRectangleBorder(borderRadius: BorderHelper.r10),
          ),
          child: Text(
            state.dayText(state.daysInWeek[index]),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color:
                      state.enableDay(index) ? Colors.white : XColors.primary2,
                  letterSpacing: -0.41,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
            textAlign: TextAlign.center,
          ),
        );
      },
      buildWhen: (p, c) =>
          p.currentWeek != c.currentWeek || p.selectedDay != c.selectedDay,
    );
  }
}
