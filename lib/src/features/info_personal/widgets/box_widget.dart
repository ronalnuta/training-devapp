import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';

class BoxInfoWidget extends StatelessWidget {
  final String title;
  final double? width;
  final String content;

  const BoxInfoWidget({
    super.key,
    required this.title,
    this.width,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontSize: 16, color: Colors.black),
        ),
        GapHelper.h12,
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border.all(color: Colors.black.withOpacity(0.1), width: 2.5),
            borderRadius: BorderHelper.r16,
          ),
          width: width,
          child: AutoSizeText(
            content,
            style:
                Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
