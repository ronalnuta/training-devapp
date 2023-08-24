import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';

class BottomSheetLogout extends StatelessWidget {
  const BottomSheetLogout({super.key});

  @override
  Widget build(BuildContext context) {
    final sTitle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderHelper.r30,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(-10, 0),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      height: 275.h,
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: XColors.avatar,
            borderRadius: BorderHelper.r8,
          ),
          width: 73.w,
          height: 8.h,
        ),
        GapHelper.h28,
        Text(
          "Đăng xuất",
          style: sTitle?.copyWith(
            color: Colors.red,
            letterSpacing: -0.41,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20),
          child: const Divider(thickness: 1, color: XColors.divider),
        ),
        Text(
          "Bạn có chắc muốn đăng xuất ?",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                letterSpacing: -0.41,
                height: 1.5,
                fontSize: 16,
              ),
          textAlign: TextAlign.center,
        ),
        GapHelper.h28,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ElevatedButton(
            onPressed: () => Navigator.pop(XCoordinator.context),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              elevation: 0,
              foregroundColor: XColors.primary,
              backgroundColor: Colors.white,
              fixedSize: Size(140.w, 55.h),
            ),
            child: Text(
              'Không',
              style: sTitle?.copyWith(
                color: XColors.primary,
                letterSpacing: -0.41,
                height: 1.5,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () => GetIt.I<AccountBloc>().logout(),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              elevation: 8,
              foregroundColor: Colors.white,
              backgroundColor: XColors.primary,
              shadowColor: XColors.primary.withOpacity(0.25),
              fixedSize: Size(140.w, 55.h),
              shape: RoundedRectangleBorder(borderRadius: BorderHelper.r30),
            ),
            child: Text(
              'Có',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    letterSpacing: -0.41,
                    height: 1.5,
                    fontSize: 18,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ]),
    );
  }
}
