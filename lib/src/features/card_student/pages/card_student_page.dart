import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';
import 'package:my_app/src/utils/helper/screen.dart';
import 'package:my_app/widgets/button/ic_notfication_button.dart';

class CardStudentPage extends StatelessWidget {
  const CardStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GapHelper.h70,
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          GapHelper.w20,
          Text(
            'THẺ SINH VIÊN',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white, letterSpacing: -0.41),
          ),
          const Spacer(),
          const XIconNotificationButton(),
          GapHelper.w24,
        ]),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            'Nguyễn Huỳnh Duyên',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: -0.41,
                ),
            textAlign: TextAlign.start,
          ),
        ),
        GapHelper.h20,
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(-10, 0),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: XColors.card,
                  borderRadius: BorderHelper.r20,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(-11, 0),
                      blurRadius: 22,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                width: 340.w,
                height: 192.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: XScreen.hasBottomNotch(context) ? 40.h : 20.h,
                ),
                child: Image.asset(XImage.bannerCardStudent),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Thực hiện các hoạt động liên quan đến học tập và sinh hoạt tại trường học một cách thuận tiện và tiết kiệm thời gian.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: XScreen.hBottomNavigation),
            ]),
          ),
        ),
      ]),
      backgroundColor: XColors.primary,
    );
  }
}
