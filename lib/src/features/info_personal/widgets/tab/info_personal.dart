import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/features/info_personal/cubit/info_personal_bloc.dart';
import 'package:my_app/src/features/info_personal/widgets/box_widget.dart';
import 'package:my_app/src/features/info_personal/widgets/tab/base_info_tab.dart';

import 'package:my_app/src/utils/helper/gap.dart';

class InfoPersonal extends StatelessWidget {
  const InfoPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    final isTeacher = GetIt.I<AccountBloc>().state.isTeacher;
    final wSmall = 140.w;
    final wMax = ScreenUtil().screenWidth;

    return BlocBuilder<InfoPersonalBloc, InfoPersonalState>(
      builder: (_, state) {
        final fullName = isTeacher
            ? '${state.infoTeacher.lastAndMiddleName ?? ""} ${state.infoTeacher.firstName ?? ""}'
            : '${state.infoStudent.lastAndMiddleName ?? ""} ${state.infoStudent.firstName ?? ""}';
        final dateOfBirth = isTeacher
            ? state.infoTeacher.dateOfBirth ?? ""
            : state.infoStudent.dateOfBirth ?? "";
        final placeOfBirth = isTeacher
            ? state.infoTeacher.placeOfBirth ?? ""
            : state.infoStudent.placeOfBirth ?? "";
        final numberIC = isTeacher
            ? state.infoTeacher.numberIC ?? ""
            : state.infoStudent.numberIC ?? "";
        final nation = isTeacher
            ? state.infoTeacher.nation ?? ""
            : state.infoStudent.nation ?? "";
        final religion = isTeacher
            ? state.infoTeacher.religion ?? ""
            : state.infoStudent.religion ?? "";
        final numberPhone = isTeacher
            ? state.infoTeacher.numberPhone ?? ""
            : state.infoStudent.numberPhone ?? "";
        final email = isTeacher
            ? state.infoTeacher.email ?? ""
            : state.infoStudent.email ?? "";
        final currentResidence = isTeacher
            ? state.infoTeacher.currentResidence ?? ""
            : state.infoStudent.permanentAddress ?? "";

        return BaseInfoTab(children: [
          BoxInfoWidget(
            title: 'Họ và tên',
            width: wMax,
            content: fullName,
          ),
          GapHelper.h20,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BoxInfoWidget(
              title: 'Ngày sinh',
              width: wSmall,
              content: dateOfBirth,
            ),
            BoxInfoWidget(
              title: 'Nơi sinh',
              width: wSmall,
              content: placeOfBirth,
            ),
          ]),
          GapHelper.h20,
          BoxInfoWidget(
            title: 'CMND/CCCD',
            width: wMax,
            content: numberIC,
          ),
          GapHelper.h20,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BoxInfoWidget(
              title: 'Dân tộc',
              width: wSmall,
              content: nation,
            ),
            BoxInfoWidget(
              title: 'Tôn giáo',
              width: wSmall,
              content: religion,
            ),
          ]),
          GapHelper.h20,
          BoxInfoWidget(
            title: 'Số điện thoại',
            width: wMax,
            content: numberPhone,
          ),
          GapHelper.h20,
          BoxInfoWidget(
            title: 'Email',
            width: wMax,
            content: email,
          ),
          GapHelper.h20,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BoxInfoWidget(
              title: 'Ngày vào Đoàn',
              width: wSmall,
              content: '',
            ),
            BoxInfoWidget(
              title: 'Ngày vào Đảng',
              width: wSmall,
              content: '',
            ),
          ]),
          GapHelper.h20,
          BoxInfoWidget(
            title: 'Địa chỉ liên hệ',
            width: wMax,
            content: currentResidence,
          ),
          GapHelper.h20,
          BoxInfoWidget(
            title: 'Hộ khẩu thường trú',
            width: wMax,
            content: currentResidence,
          ),
          GapHelper.h20,
        ]);
      },
      buildWhen: (p, c) => isTeacher
          ? p.infoTeacher != c.infoTeacher
          : p.infoStudent != c.infoStudent,
    );
  }
}
