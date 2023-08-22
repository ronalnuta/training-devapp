import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: SizedBox(
        width: 348.w,
        height: 69.h,
        child: Row(children: [
          Container(
            decoration: const BoxDecoration(
              color: XColors.primary,
              shape: BoxShape.circle,
            ),
            width: 12.w,
            height: 12.w,
          ),
          GapHelper.w8,
          SizedBox(
            width: 60.w,
            height: 69.w,
            child: Stack(children: [
              CircleAvatar(
                backgroundColor: XColors.text,
                maxRadius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: ClipOval(
                    child: Image.network('https://via.placeholder.com/150'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(XImage.icNofify1),
              ),
            ]),
          ),
          GapHelper.w16,
          Expanded(
            child: Column(children: [
              Expanded(
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: AutoSizeText(
                      'Thông báo lịch',
                      style:
                          textTheme.titleLarge?.copyWith(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: AutoSizeText(
                      '10 phút',
                      style: textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ]),
              ),
              Text(
                'Đến hạn nộp bài Tư tưởng rồi bạn ơi',
                style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
