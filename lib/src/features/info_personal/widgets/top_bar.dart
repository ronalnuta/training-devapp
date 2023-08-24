import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/info_personal/cubit/info_student_bloc.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/radius.dart';

class TopBarInfoStudent extends StatelessWidget {
  const TopBarInfoStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoStudentBloc, InfoStudentState>(
      builder: (context, state) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          state.info.index == 0
              ? const Spacer()
              : Expanded(
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () =>
                        context.read<InfoStudentBloc>().onPrevious(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
          Container(
            decoration: BoxDecoration(
              color: XColors.diableButton,
              borderRadius: BorderHelper.r10,
            ),
            width: 178.w,
            height: 34.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Center(
              child: Text(
                state.info.nameOf,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          state.info.index == 2
              ? const Spacer()
              : Expanded(
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () => context.read<InfoStudentBloc>().onNext(),
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
        ]);
      },
      buildWhen: (p, c) => p.info != c.info,
    );
  }
}
