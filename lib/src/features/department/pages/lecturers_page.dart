import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/department/cubit/lecturers_bloc.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';
import 'package:my_app/widgets/common/indicator.dart';

class LecturersPage extends StatelessWidget {
  final int userId;
  final String? name;
  const LecturersPage({
    super.key,
    required this.userId,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LecturersBloc(userId),
      child: BlocBuilder<LecturersBloc, LecturersState>(
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                name ?? "Thông tin giảng viên",
                textAlign: TextAlign.center,
              ),
            ),
            body: state.isLoading
                ? const XIndicator()
                : Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                      horizontal: 20.w,
                    ),
                    child: Column(children: [
                      _Item(
                        title: 'Họ và tên',
                        content: state.data.name,
                      ),
                      GapHelper.h20,
                      _Item(
                        title: 'Email cá nhân',
                        content: state.data.personalEmail,
                      ),
                      GapHelper.h20,
                      _Item(
                        title: 'Email cơ quan',
                        content: state.data.workEmail,
                      ),
                      GapHelper.h20,
                      _Item(
                        title: 'SĐT di động',
                        content: state.data.personalPhone,
                      ),
                      GapHelper.h20,
                      _Item(
                        title: 'SĐT cơ quan',
                        content: state.data.workPhone,
                      ),
                      GapHelper.h20,
                      _Item(
                        title: 'Chức vụ',
                        content: state.data.position,
                      ),
                      GapHelper.h20,
                    ]),
                  ),
          );
        },
        buildWhen: (p, c) => p.data != c.data || p.isLoading != c.isLoading,
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String content;
  const _Item({
    required this.title,
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
          width: ScreenUtil().screenWidth,
          child: Text(
            content,
            style:
                Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
