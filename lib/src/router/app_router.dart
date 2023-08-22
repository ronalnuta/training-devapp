import 'package:flutter/material.dart';
import 'package:my_app/src/features/attendance/pages/attendance_page.dart';
import 'package:my_app/src/features/attendance/pages/manager_attendance_page.dart';
import 'package:my_app/src/features/common/pages/not_found_page.dart';
import 'package:my_app/src/features/dashboard/pages/dashboard_page.dart';
import 'package:my_app/src/features/department/pages/department_page.dart';
import 'package:my_app/src/features/department/pages/lecturers_department_page.dart';
import 'package:my_app/src/features/department/pages/lecturers_page.dart';
import 'package:my_app/src/features/forgot_password/pages/forgot_password_page.dart';
import 'package:my_app/src/features/info_personal/pages/info_student_page.dart';
import 'package:my_app/src/features/loading/splash_page.dart';
import 'package:my_app/src/features/login/pages/login_page.dart';
import 'package:my_app/src/features/message/pages/message_content_page.dart';
import 'package:my_app/src/features/message/pages/message_page.dart';
import 'package:my_app/src/features/message/pages/message_sent_page.dart';
import 'package:my_app/src/features/news/pages/news_content_page.dart';
import 'package:my_app/src/features/news/pages/news_page.dart';
import 'package:my_app/src/features/notification/pages/notification_page.dart';
import 'package:my_app/src/features/onboarding/pages/onboarding_page.dart';
import 'package:my_app/src/features/other_work_schedule/pages/other_work_schedule_content_page.dart';
import 'package:my_app/src/features/other_work_schedule/pages/other_work_schedule_page.dart';
import 'package:my_app/src/features/scan/pages/scan_page.dart';
import 'package:my_app/src/features/schedule/pages/schedule_page.dart';
import 'package:my_app/src/features/work_schedule/pages/work_schedule_content_page.dart';
import 'package:my_app/src/features/work_schedule/pages/work_schedule_page.dart';
import 'package:my_app/src/router/router_name.dart';

class XAppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XRouterName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case XRouterName.signIn:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case XRouterName.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case XRouterName.onboard:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case XRouterName.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case XRouterName.schedule:
        return MaterialPageRoute(builder: (_) => const SchedulePage());
      case XRouterName.info:
        return MaterialPageRoute(builder: (_) => const InfoStudentPage());
      case XRouterName.attendanceStudent:
        return MaterialPageRoute(
            builder: (_) => const AttendancePage(
                  nameCourse: "",
                  codeCourse: "",
                  nameTeacher: "",
                  nameRoom: "",
                  semesterId: "",
                ));
      case XRouterName.scanQr:
        return MaterialPageRoute(builder: (_) => const ScanQrPage());
      case XRouterName.notification:
        return MaterialPageRoute(builder: (_) => const NotificationPage());
      case XRouterName.workScheduleContent:
        return MaterialPageRoute(
          builder: (_) => const WorkScheduleContentPage(workScheduleId: 0),
        );
      case XRouterName.otherWorkScheduleContent:
        return MaterialPageRoute(
          builder: (_) =>
              const OtherWorkScheduleContentPage(otherWorkScheduleId: 0),
        );
      case XRouterName.newsContent:
        return MaterialPageRoute(
          builder: (_) => const NewsContentPage(newsId: 0),
        );
      case XRouterName.department:
        return MaterialPageRoute(builder: (_) => const DepartmentPage());
      case XRouterName.lecturersDepartment:
        return MaterialPageRoute(
          builder: (_) => const LecturersDepartmentPage(departmentId: 0),
        );
      case XRouterName.workSchedule:
        return MaterialPageRoute(builder: (_) => const WorkSchedulePage());
      case XRouterName.otherWorkSchedule:
        return MaterialPageRoute(builder: (_) => const OtherWorkSchedulePage());
      case XRouterName.news:
        return MaterialPageRoute(builder: (_) => const NewsPage());
      case XRouterName.message:
        return MaterialPageRoute(builder: (_) => const MessagePage());
      case XRouterName.messageContent:
        return MaterialPageRoute(
          builder: (_) => const MessageContentPage(messageId: 0),
        );
      case XRouterName.messageSent:
        return MaterialPageRoute(builder: (_) => const MessageSentPage());
      case XRouterName.lecturers:
        return MaterialPageRoute(
          builder: (_) => const LecturersPage(userId: 0),
        );
      case XRouterName.managerAttendance:
        return MaterialPageRoute(
            builder: (_) => const ManagerAttendancePage(
                  courseId: "",
                  semesterId: "",
                ));

      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
