import 'package:flutter/material.dart';
import 'package:my_app/src/features/attendance/pages/attendance_page.dart';
import 'package:my_app/src/features/attendance/pages/manager_attendance_page.dart';
import 'package:my_app/src/features/department/pages/department_page.dart';
import 'package:my_app/src/features/department/pages/lecturers_department_page.dart';
import 'package:my_app/src/features/department/pages/lecturers_page.dart';
import 'package:my_app/src/features/message/pages/message_content_page.dart';
import 'package:my_app/src/features/message/pages/message_page.dart';
import 'package:my_app/src/features/message/pages/message_sent_page.dart';
import 'package:my_app/src/features/news/pages/news_content_page.dart';
import 'package:my_app/src/features/news/pages/news_page.dart';
import 'package:my_app/src/features/other_work_schedule/pages/other_work_schedule_content_page.dart';
import 'package:my_app/src/features/other_work_schedule/pages/other_work_schedule_page.dart';
import 'package:my_app/src/features/schedule/pages/schedule_page.dart';
import 'package:my_app/src/features/work_schedule/pages/work_schedule_content_page.dart';
import 'package:my_app/src/features/work_schedule/pages/work_schedule_page.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/router/router_name.dart';

class XCoordinator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final domain = Domain();

  static BuildContext get context => navigatorKey.currentState!.context;
  static NavigatorState get navigator => navigatorKey.currentState!;
  static void pop<T extends Object?>([T? result]) async {
    return navigatorKey.currentState!.pop(result);
  }

  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      navigator.pushNamed(
        routeName,
        arguments: arguments,
      );

  static Future<T?> push<T extends Object?>(Widget screen) => navigator.push(
        MaterialPageRoute(builder: (context) => screen),
      );

  static Future showSignIn() => pushNamed(XRouterName.signIn);

  static Future logoutAndShowSignIn() => navigator.pushNamedAndRemoveUntil(
        XRouterName.signIn,
        (_) => false,
      );

  static Future showDashboard() => pushNamed(XRouterName.dashboard);

  static Future showSchedule() => push(const SchedulePage());

  static Future showInfo() => pushNamed(XRouterName.info);

  static Future showAttendance({
    required String codeCourse,
    required String nameCourse,
    required String nameRoom,
    required String nameTeacher,
    required String semesterId,
  }) =>
      push(AttendancePage(
        nameCourse: nameCourse,
        codeCourse: codeCourse,
        nameTeacher: nameTeacher,
        nameRoom: nameRoom,
        semesterId: semesterId,
      ));

  static Future showScanQR() => pushNamed(XRouterName.scanQr);

  static Future showNotification() => pushNamed(XRouterName.notification);

  static Future showWorkScheduleContent(int workScheduleId) =>
      push(WorkScheduleContentPage(workScheduleId: workScheduleId));

  static Future showOtherWorkScheduleContent(int otherWorkScheduleId) => push(
        OtherWorkScheduleContentPage(otherWorkScheduleId: otherWorkScheduleId),
      );

  static Future showNewsContent(int newsId) =>
      push(NewsContentPage(newsId: newsId));

  static Future showDepartment() => push(const DepartmentPage());

  static Future showLecturersDepartment({
    required int departmentId,
    String? departmentName,
  }) =>
      push(LecturersDepartmentPage(
        departmentId: departmentId,
        departmentName: departmentName,
      ));

  static Future showWorkSchedule() => push(const WorkSchedulePage());

  static Future showOtherWorkSchedule() => push(const OtherWorkSchedulePage());

  static Future showNews() => push(const NewsPage());

  static Future showMessage() => push(const MessagePage());

  static Future showMessageContent(int messageId) =>
      push(MessageContentPage(messageId: messageId));

  static Future showMessageSent() => push(const MessageSentPage());

  static Future showLecturers({
    required int userId,
    String? name,
  }) =>
      push(LecturersPage(
        userId: userId,
        name: name,
      ));

  static Future showManagerAttendancePage({
    required String semesterId,
    required String courseId,
  }) =>
      push(ManagerAttendancePage(courseId: courseId, semesterId: semesterId));
}
