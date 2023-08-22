import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/float_bottom_navigation/cubit/bottom_navigation_bloc.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';
import 'package:my_app/widgets/common/empty_widget.dart';

class FloatBottomNavigation extends StatelessWidget {
  const FloatBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 0),
                blurRadius: 10,
              ),
            ],
          ),
          constraints: BoxConstraints(maxHeight: 80.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(PageIndex.values.length, (i) {
              final element = PageIndex.values[i];
              if ((element == PageIndex.calendar ||
                  element == PageIndex.studentCard)) {
                return const EmptyWidget();
              }

              return Expanded(
                child: GestureDetector(
                  onTap: () =>
                      context.read<BottomNavigationBloc>().onItemTapped(i),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      element.iconOf(isActived: state.pageIndex == element),
                      GapHelper.h4,
                      state.pageIndex == element
                          ? Container(
                              decoration: BoxDecoration(
                                color: XColors.primary,
                                borderRadius: BorderHelper.r2,
                              ),
                              width: 20.w,
                              height: 5.h,
                            )
                          : const EmptyWidget(),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      },
      buildWhen: (p, c) => p.pageIndex != c.pageIndex,
    );
  }
}
