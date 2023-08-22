import 'package:my_app/src/network/repositories/attendance/attendance_repository.dart';
import 'package:my_app/src/network/repositories/attendance/attendance_repository_impl.dart';
import 'package:my_app/src/network/repositories/department/department_repository_impl.dart';
import 'package:my_app/src/network/repositories/message/message_repository.dart';
import 'package:my_app/src/network/repositories/message/message_repository_impl.dart';
import 'package:my_app/src/network/repositories/news/news_repository.dart';
import 'package:my_app/src/network/repositories/news/news_repository_impl.dart';
import 'package:my_app/src/network/repositories/timetable/timetable_repository.dart';
import 'package:my_app/src/network/repositories/timetable/timetable_repository_impl.dart';
import 'package:my_app/src/network/repositories/work_schedule/work_schedule_repository.dart';
import 'repositories/department/department_repository.dart';
import 'repositories/user/user_repository.dart';
import 'repositories/user/user_repository_impl.dart';
import 'repositories/work_schedule/work_schedule_repository_impl.dart';

class Domain {
  static Domain? _internal;
  factory Domain() {
    _internal ??= Domain._();

    return _internal!;
  }
  late UserRepository userRepository;
  late WorkScheduleRepository workScheduleRepository;
  late NewsRepository newsRepository;
  late DepartmentRepository departmentRepository;
  late MessageRepository messageRepository;
  late TimetableRepository timetableRepository;
  late AttendanceRepository attendanceRepository;
  Domain._() {
    userRepository = UserRepositoryImpl();
    workScheduleRepository = WorkScheduleRepositoryImpl();
    newsRepository = NewsRepositoryImpl();
    departmentRepository = DepartmentRepositoryImpl();
    messageRepository = MessageRepositoryImpl();
    timetableRepository = TimetableRepositoryImpl();
    attendanceRepository = AttendanceRepositoryImpl();
  }
}
