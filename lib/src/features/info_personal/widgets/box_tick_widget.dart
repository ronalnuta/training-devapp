import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';

class BoxTickInfoWidget extends StatelessWidget {
  final String label;
  final bool isMale;
  const BoxTickInfoWidget({
    super.key,
    required this.label,
    this.isMale = false,
  });

  @override
  Widget build(BuildContext context) {
    final square = 25.w;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Giới tính",
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontSize: 16, color: Colors.black),
        ),
        GapHelper.h12,
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border.all(color: Colors.black.withOpacity(0.1), width: 2.5),
            borderRadius: BorderHelper.r16,
          ),
          width: 140.w,
          child: Row(children: [
            isMale
                ? Container(
                    decoration: const BoxDecoration(
                      color: XColors.primary,
                      shape: BoxShape.circle,
                    ),
                    width: square,
                    height: square,
                    child: const Icon(Icons.check, color: Colors.white),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: XColors.greySex,
                      border: Border.all(color: XColors.primary, width: 1),
                      shape: BoxShape.circle,
                    ),
                    width: square,
                    height: square,
                  ),
            GapHelper.w8,
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 16),
            ),
          ]),
        ),
      ],
    );
  }
}
