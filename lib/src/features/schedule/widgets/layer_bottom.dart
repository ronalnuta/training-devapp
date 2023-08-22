import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/features/schedule/cubit/list_schedule_bloc.dart';

class LayerBottomSchedule extends StatelessWidget {
  const LayerBottomSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListScheduleBloc, ListScheduleState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            state.isEmpty ? XImage.scheduleEmpty : XImage.schedule,
            width: ScreenUtil().screenWidth,
            height: 195.h,
            fit: BoxFit.fill,
          ),
        );
      },
      buildWhen: (p, c) => p.isEmpty != c.isEmpty,
    );
  }
}
