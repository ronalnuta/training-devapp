import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/features/schedule/cubit/schedule_bloc.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/radius.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isTeacher = GetIt.I<AccountBloc>().state.isTeacher;

    return BlocBuilder<ScheduleBloc, ScheduleState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ScheduleType.values.map((value) {
            final index = ScheduleType.values.indexOf(value);

            return ChoiceChip(
              label: SizedBox(
                width: 80.w,
                height: 25.h,
                child: Center(
                  child: Text(
                    value.nameOf(isTeacher),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: state.type.index == index
                              ? Colors.white
                              : XColors.primary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onSelected: (selected) =>
                  context.read<ScheduleBloc>().onSelectedTypeSchedule(
                        ScheduleType.values[selected ? index : 0],
                      ),
              selected: state.type.index == index,
              selectedColor: XColors.primary,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: XColors.primary, width: 1),
                borderRadius: BorderHelper.r20,
              ),
              backgroundColor: Colors.white,
              padding: EdgeInsets.zero,
              elevation: 5,
              shadowColor: Colors.transparent,
              selectedShadowColor: Colors.black,
            );
          }).toList(),
        );
      },
      buildWhen: (p, c) => p.type != c.type,
    );
  }
}
