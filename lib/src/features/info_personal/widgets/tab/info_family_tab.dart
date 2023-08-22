import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/info_personal/cubit/info_family_bloc.dart';
import 'package:my_app/src/features/info_personal/widgets/box_widget.dart';
import 'package:my_app/src/features/info_personal/widgets/tab/base_info_tab.dart';
import 'package:my_app/src/utils/helper/gap.dart';

class InfoFamilyTab extends StatelessWidget {
  const InfoFamilyTab({super.key});

  @override
  Widget build(BuildContext context) {
    final wMax = ScreenUtil().screenWidth;
    final wSmall = 140.w;

    return BlocBuilder<InfoFamilyBloc, InfoFamilyState>(
      builder: (_, state) {
        return BaseInfoTab(children: [
          BoxInfoWidget(
            title: 'Họ và tên ${state.family?.nameOf}',
            width: wMax,
            content: 'Nguyễn Văn A',
          ),
          GapHelper.h20,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BoxInfoWidget(
              title: 'Năm sinh',
              width: wSmall,
              content: '1970',
            ),
            BoxInfoWidget(
              title: 'Nghề nghiệp',
              width: wSmall,
              content: 'Kinh doanh',
            ),
          ]),
          GapHelper.h20,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
          ]),
          GapHelper.h20,
          BoxInfoWidget(
            title: 'Số điện thoại',
            width: wMax,
            content: '0399651xxx',
          ),
          GapHelper.h20,
          BoxInfoWidget(
            title: 'Cơ quan công tác ',
            width: wMax,
            content: '',
          ),
          GapHelper.h20,
          BoxInfoWidget(
            title: 'Hộ khẩu',
            width: wMax,
            content: 'phường Phú Thủy, TP. Phan Thiết, Bình Thuận',
          ),
          GapHelper.h20,
          BoxInfoWidget(
            title: 'Chỗ ở hiện nay',
            width: wMax,
            content: 'phường Phú Thủy, TP. Phan Thiết, Bình Thuận',
          ),
        ]);
      },
      buildWhen: (p, c) => p.family != c.family,
    );
  }
}
