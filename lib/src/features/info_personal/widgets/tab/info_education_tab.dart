import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/info_personal/widgets/box_tick_widget.dart';
import 'package:my_app/src/features/info_personal/widgets/box_widget.dart';
import 'package:my_app/src/features/info_personal/widgets/tab/base_info_tab.dart';

import 'package:my_app/src/utils/helper/gap.dart';

class InfoEducationTab extends StatelessWidget {
  const InfoEducationTab({super.key});

  @override
  Widget build(BuildContext context) {
    final wMax = ScreenUtil().screenWidth;

    return BaseInfoTab(
      children: [
        BoxInfoWidget(
          title: 'Họ và tên',
          width: wMax,
          content: 'Nguyễn Huỳnh Duyên',
        ),
        GapHelper.h20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoxInfoWidget(
              title: 'MSSV',
              width: 170.w,
              content: '2151120029',
            ),
            BoxInfoWidget(
              title: 'Lớp',
              width: 100.w,
              content: 'CN21',
            ),
          ],
        ),
        GapHelper.h20,
        BoxInfoWidget(
          title: 'Bậc đào tạo',
          width: wMax,
          content: 'Đại học - chính quy',
        ),
        GapHelper.h20,
        BoxInfoWidget(
          title: 'Khoa',
          width: wMax,
          content: 'Công nghệ thông tin',
        ),
        GapHelper.h20,
        BoxInfoWidget(
          title: 'Chuyên ngành',
          width: wMax,
          content: 'Công nghệ thông tin',
        ),
        GapHelper.h20,
        BoxInfoWidget(
          title: 'Ngày vào trường',
          width: wMax,
          content: '29/9/2021',
        ),
        GapHelper.h20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoxInfoWidget(
              title: 'Khóa',
              width: 100.w,
              content: '2021',
            ),
            BoxInfoWidget(
              title: 'Trạng thái',
              width: 170.w,
              content: 'Đang học',
            ),
          ],
        ),
        GapHelper.h20,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoxTickInfoWidget(label: "Nam", isMale: true),
            BoxTickInfoWidget(
              label: "Nữ",
            ),
          ],
        ),
      ],
    );
  }
}
