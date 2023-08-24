import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/features/schedule/cubit/manage_calendar_bloc.dart';
import 'package:my_app/src/features/schedule/cubit/schedule_bloc.dart';
import 'package:my_app/src/features/schedule/widgets/list_schedule/card_schedule.dart';
import 'package:my_app/src/features/schedule/widgets/list_schedule/empty_schedule.dart';
import 'package:my_app/src/network/model/timetable/exam_schedule_student_model.dart';
import 'package:my_app/src/network/model/timetable/exam_schedule_teacher_model.dart';
import 'package:my_app/src/network/model/timetable/timetable_student_model.dart';
import 'package:my_app/src/network/model/timetable/timetable_teacher_model.dart';
import 'package:my_app/src/utils/calendar_utils.dart';

class ListScheduleView extends StatelessWidget {
  const ListScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    final isTeacher = GetIt.I<AccountBloc>().state.isTeacher;
    if (isTeacher) {
      return _listViewForTeacher();
    } else {
      return _listViewForStudent();
    }
  }

  Widget _listViewForStudent() {
    return BlocBuilder<ManageCalendarBloc, ManageCalendarState>(
        builder: (_, stateCalendar) {
          return BlocBuilder<ScheduleBloc, ScheduleState>(
              builder: (_, state) {
                switch (state.type) {
                  case ScheduleType.myClass:
                    final result = state.listStudent
                        .where((e) => CalendarUtils().compareDates(
                            e.date ?? "", stateCalendar.selectedDay))
                        .toList();
                    if (result.isEmpty) {
                      return const EmptyScheduleWidget();
                    }

                    return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            itemBuilder: (_, i) {
                              return _ListItemCardScheduleStudent(
                                  itemCount: 1,
                                  data: result[i],
                                  semesterId: state.semesterIdStudent);
                            },
                            itemCount: result.length));
                  case ScheduleType.exam:
                    final result = state.listExamStudent
                        .where((e) => CalendarUtils().compareDates(
                            e.date ?? "", stateCalendar.selectedDay))
                        .toList();
                    if (result.isEmpty) {
                      return const EmptyScheduleWidget();
                    }

                    return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            itemBuilder: (_, i) {
                              return _ListItemCardScheduleExamStudent(
                                  itemCount: 1,
                                  data: result[i],
                                  semesterId: state.semesterIdStudent);
                            },
                            itemCount: result.length));
                  default:
                    return const EmptyScheduleWidget();
                }
              },
              buildWhen: (p, c) =>
                  p.listStudent != c.listStudent ||
                  p.listExamStudent != c.listExamStudent ||
                  p.type != c.type);
        },
        buildWhen: (p, c) => p.selectedDay != c.selectedDay);
  }

  Widget _listViewForTeacher() {
    return BlocBuilder<ManageCalendarBloc, ManageCalendarState>(
        builder: (_, stateCalendar) {
          return BlocBuilder<ScheduleBloc, ScheduleState>(
              builder: (_, state) {
                switch (state.type) {
                  case ScheduleType.myClass:
                    final result = state.list
                        .where((e) => CalendarUtils().compareDates(
                            e.date ?? "", stateCalendar.selectedDay))
                        .toList();
                    if (result.isEmpty) {
                      return const EmptyScheduleWidget();
                    }

                    return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            itemBuilder: (_, i) {
                              return _ListItemCardSchedule(
                                  itemCount: 1,
                                  data: result[i],
                                  semesterId: state.semesterIdTeacher);
                            },
                            itemCount: result.length));
                  case ScheduleType.exam:
                    final result = state.listExam
                        .where((e) => CalendarUtils().compareDates(
                            e.date ?? "", stateCalendar.selectedDay))
                        .toList();
                    if (result.isEmpty) {
                      return const EmptyScheduleWidget();
                    }

                    return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            itemBuilder: (_, i) {
                              return _ListItemCardScheduleExam(
                                  itemCount: 1,
                                  data: result[i],
                                  semesterId: state.semesterIdTeacher);
                            },
                            itemCount: result.length));
                  default:
                    return const EmptyScheduleWidget();
                }
              },
              buildWhen: (p, c) =>
                  p.list != c.list ||
                  p.listExam != c.listExam ||
                  p.type != c.type);
        },
        buildWhen: (p, c) => p.selectedDay != c.selectedDay);
  }
}

class _ListItemCardSchedule extends StatelessWidget {
  final int itemCount;
  final TimetableTeacherModel data;
  final String semesterId;
  const _ListItemCardSchedule({
    required this.itemCount,
    required this.data,
    required this.semesterId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 10.h),
      itemBuilder: (_, i) {
        return CardSchedule(
            period: "${data.startPeriod} - ${data.endPeriod}",
            nameCourse: data.courseName ?? "",
            position: CardPosition.none,
            codeCourse: data.courseCode ?? "",
            nameTeacher: "",
            nameRoom: data.courseName ?? "",
            timeStart: '',
            timeEnd: "",
            semesterId: semesterId);
      },
      itemCount: itemCount,
    );
  }
}

class _ListItemCardScheduleExam extends StatelessWidget {
  final int itemCount;
  final ExamScheduleTeacherModel data;
  final String semesterId;
  const _ListItemCardScheduleExam({
    required this.itemCount,
    required this.data,
    required this.semesterId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 10.h),
      itemBuilder: (_, i) {
        return CardSchedule(
            period: "${data.startPeriod} - ${data.endPeriod}",
            nameCourse: data.courseName ?? "",
            position: CardPosition.none,
            codeCourse: data.courseCode ?? "",
            nameTeacher: "",
            nameRoom: data.courseName ?? "",
            timeStart: '',
            timeEnd: "",
            semesterId: semesterId);
      },
      itemCount: itemCount,
    );
  }
}

class _ListItemCardScheduleStudent extends StatelessWidget {
  final int itemCount;
  final TimetableStudentModel data;
  final String semesterId;
  const _ListItemCardScheduleStudent({
    required this.itemCount,
    required this.data,
    required this.semesterId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 10.h),
      itemBuilder: (_, i) {
        return CardSchedule(
            period: "${data.startPeriod} - ${data.endPeriod}",
            nameCourse: data.courseName ?? "",
            position: CardPosition.none,
            codeCourse: data.courseCode ?? "",
            nameTeacher: "",
            nameRoom: data.courseName ?? "",
            timeStart: '',
            timeEnd: "",
            semesterId: semesterId);
      },
      itemCount: itemCount,
    );
  }
}

class _ListItemCardScheduleExamStudent extends StatelessWidget {
  final int itemCount;
  final ExamScheduleStudentModel data;
  final String semesterId;
  const _ListItemCardScheduleExamStudent({
    required this.itemCount,
    required this.data,
    required this.semesterId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 10.h),
      itemBuilder: (_, i) {
        return CardSchedule(
            period: "${data.startPeriod} - ${data.endPeriod}",
            nameCourse: data.courseName ?? "",
            position: CardPosition.none,
            codeCourse: data.courseCode ?? "",
            nameTeacher: "",
            nameRoom: data.courseName ?? "",
            timeStart: '',
            timeEnd: "",
            semesterId: semesterId);
      },
      itemCount: itemCount,
    );
  }
}
