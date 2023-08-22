import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';

class HeaderAttendanceStudentWidget extends StatelessWidget {
  const HeaderAttendanceStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final wMax = ScreenUtil().screenWidth;
    final textTheme = Theme.of(context).textTheme;
    final radius = Radius.circular(20.r);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20.w,
        MediaQuery.of(context).padding.top + 20,
        20.w,
        25.h,
      ),
      child: SizedBox(
        width: wMax,
        height: 58.h + 58.h,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: radius,
                  bottomLeft: radius,
                  bottomRight: radius,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(-5, -5),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              width: wMax,
              height: 58.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      'MSSV :',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: XColors.primary, fontSize: 16),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: AutoSizeText(
                      '2151120029',
                      style: textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      'Lớp :',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: XColors.primary, fontSize: 16),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: AutoSizeText(
                      'CN21',
                      style: textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil().screenWidth,
            height: 58.h,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(40.w, 40.w),
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                ),
                child: const Icon(Icons.arrow_back, color: XColors.primary),
              ),
              GapHelper.w16,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: radius,
                      topRight: radius,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: const Offset(-5, -12),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Nguyễn Huỳnh Duyên',
                      style: textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
