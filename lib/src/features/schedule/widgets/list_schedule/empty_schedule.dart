import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/utils/helper/gap.dart';

class EmptyScheduleWidget extends StatelessWidget {
  const EmptyScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            'Hiện chưa có thông tin',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7),
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Image.asset(
            XImage.note,
            width: 188.w,
            height: 188.w,
            fit: BoxFit.fill,
          ),
          GapHelper.h195,
        ],
      ),
    );
  }
}
