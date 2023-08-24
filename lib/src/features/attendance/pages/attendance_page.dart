import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/attendance/cubit/attendance_bloc.dart';
import 'package:my_app/src/features/attendance/widgets/detail_attendance_subject.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/widgets/common/empty_widget.dart';

class AttendancePage extends StatelessWidget {
  final String nameCourse;
  final String codeCourse;
  final String nameTeacher;
  final String nameRoom;
  final String semesterId;

  const AttendancePage({
    super.key,
    required this.nameCourse,
    required this.codeCourse,
    required this.nameTeacher,
    required this.nameRoom,
    required this.semesterId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AttendanceBloc(semesterId: semesterId, courseId: codeCourse),
      child: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Điểm danh",
                textAlign: TextAlign.center,
              ),
            ),
            body: Column(children: [
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.all(15),
                  child: Column(children: [
                    _InfoItem(title: 'Học phần :', content: nameCourse),
                    _InfoItem(title: 'Mã học phần :', content: codeCourse),
                    _InfoItem(title: 'Phòng học :', content: nameRoom),
                    _InfoItem(title: 'Giáo viên :', content: nameTeacher),
                    _InfoItem(
                        title: 'Thời gian :',
                        content: '',
                        text: Text('',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 16,
                                    letterSpacing: -0.41,
                                    height: 1.375,
                                    color: XColors.red)))
                  ])),
              const DetailAttendanceSubjectWidget()
            ]),
            backgroundColor: XColors.greySex,
          );
        },
        buildWhen: (p, c) => false,
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String content;
  final Widget? text;
  const _InfoItem({
    required this.title,
    required this.content,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.375,
                    letterSpacing: -0.41,
                  ),
              maxLines: 1,
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text ?? const EmptyWidget(),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        letterSpacing: -0.41,
                        height: 1.375,
                        color: Colors.black,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
