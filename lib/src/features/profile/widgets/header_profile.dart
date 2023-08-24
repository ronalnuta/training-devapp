import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/features/info_personal/cubit/info_personal_bloc.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final accountState = GetIt.I<AccountBloc>().state;
    final user = accountState.infoAccount;

    return BlocBuilder<InfoPersonalBloc, InfoPersonalState>(
        builder: (context, state) {
          return Padding(
              padding: EdgeInsets.fromLTRB(25.w, 80.h, 20.w, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                        backgroundImage: AssetImage(XImage.avatar), radius: 40),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 25.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderHelper.r20,
                            boxShadow: [
                              BoxShadow(
                                  color: XColors.bgScreen.withOpacity(0.2),
                                  offset: const Offset(0, 4),
                                  blurRadius: 5)
                            ]),
                        width: 230.w,
                        height: 80.h,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${user.lastAndMiddleName} ${user.firstName}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2),
                              GapHelper.h4,
                              Text(
                                  accountState.isTeacher
                                      ? state.infoTeacher.departmentName ?? ""
                                      : state.infoStudent.major ?? "",
                                  style: const TextStyle(
                                      color: XColors.text,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500))
                            ]))
                  ]));
        },
        buildWhen: (p, c) =>
            p.infoTeacher != c.infoTeacher || p.infoStudent != c.infoStudent);
  }
}
