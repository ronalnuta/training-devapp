import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/schedule/cubit/manage_calendar_bloc.dart';

class WeeklyWidget extends StatelessWidget {
  const WeeklyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageCalendarBloc, ManageCalendarState>(
      builder: (context, state) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            splashRadius: 20,
            onPressed: () =>
                context.read<ManageCalendarBloc>().onPreviousWeek(),
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
            onPressed: () => context.read<ManageCalendarBloc>().onNextWeek(),
            icon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ]);
      },
      buildWhen: (p, c) => p.currentWeek != c.currentWeek,
    );
  }
}
