import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/info_personal/widgets/box_widget.dart';
import 'package:my_app/src/features/info_personal/widgets/tab/base_info_tab.dart';

import 'package:my_app/src/utils/helper/gap.dart';

class InfoIndividualTab extends StatelessWidget {
  const InfoIndividualTab({super.key});

  @override
  Widget build(BuildContext context) {
    final wMax = ScreenUtil().screenWidth;
    final wSmall = 140.w;

    return BaseInfoTab(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoxInfoWidget(
              title: 'Ngày sinh',
              width: wSmall,
              content: '10/12/2003',
            ),
            BoxInfoWidget(
              title: 'Nơi sinh',
              width: wSmall,
              content: 'Bình Thuận',
            ),
          ],
        ),
        GapHelper.h20,
        BoxInfoWidget(
          title: 'CMND/CCCD',
          width: wMax,
          content: '0603xxxxxxxx',
        ),
        GapHelper.h20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoxInfoWidget(
              title: 'Dân tộc',
              width: wSmall,
              content: 'Kinh',
            ),
            BoxInfoWidget(
              title: 'Tôn giáo',
              width: wSmall,
              content: 'Không',
            ),
          ],
        ),
        GapHelper.h20,
        BoxInfoWidget(
          title: 'Email',
          width: wMax,
          content: 'nghuynhduyenxxx@gmail.com',
        ),
        GapHelper.h20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoxInfoWidget(
              title: 'Ngày vào Đoàn',
              width: wSmall,
              content: '26/3/2019',
            ),
            BoxInfoWidget(
              title: 'Ngày vào Đảng',
              width: wSmall,
              content: '',
            ),
          ],
        ),
        GapHelper.h20,
        BoxInfoWidget(
          title: 'Địa chỉ liên hệ',
          width: wMax,
          content: '37 Tô Ký, Tân Chánh Hiệp, Quận 12 , TP HCM',
        ),
        GapHelper.h20,
        BoxInfoWidget(
          title: 'Hộ khẩu thường trú ',
          width: wMax,
          content: 'phường Phú Thủy, TP. Phan Thiết, Bình Thuận',
        ),
        GapHelper.h20,
        BoxInfoWidget(
          title: 'Diện chính sách',
          width: wMax,
          content: '',
        ),
        GapHelper.h20,
      ],
    );
  }
}
