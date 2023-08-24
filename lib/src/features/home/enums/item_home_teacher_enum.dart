import 'package:flutter/material.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/features/home/widgets/badge_message.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/widgets/common/empty_widget.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

enum ItemHomeTeacherEnum {
  calendar,
  workingSchedule,
  otherCalendar,
  mailboxSent,
  inbox,
  // department,
  news;
  // attendance;

  String get nameOf {
    switch (this) {
      case calendar:
        return "Lịch";
      case workingSchedule:
        return "Lịch công tác";
      case otherCalendar:
        return "Lịch khác";
      case mailboxSent:
        return "Hộp thư đã gửi";
      case inbox:
        return "Hộp thư đến";
      // case department:
      //   return "Đơn vị";
      case news:
        return "Thông báo chung";
      // case attendance:
      //   return "Tạo điểm danh";
    }
  }

  String get iconOf {
    switch (this) {
      case calendar:
        return XImage.calendarHome;
      case workingSchedule:
        return XImage.workingSchedule;
      case otherCalendar:
        return XImage.otherCalendar;
      case mailboxSent:
        return XImage.mailboxSent;
      case inbox:
        return XImage.inbox;
      // case department:
      //   return XImage.phoneBook;
      case news:
        return XImage.news;
      // case attendance:
      //   return XImage.attendance;
    }
  }

  Function() onTap() {
    switch (this) {
      case calendar:
        return () => XCoordinator.showSchedule();
      case workingSchedule:
        return () => XCoordinator.showWorkSchedule();
      case otherCalendar:
        return () => XCoordinator.showOtherWorkSchedule();
      case mailboxSent:
        return () => XCoordinator.showMessageSent();
      case inbox:
        return () => XCoordinator.showMessage();
      // case department:
      //   return () => XCoordinator.showDepartment();
      case news:
        return () => XCoordinator.showNews();
      // case attendance:
      //   return () => onPressed();
    }
  }

  Widget get bagdeOf {
    switch (this) {
      case calendar:
        return const EmptyWidget();
      case workingSchedule:
        return const EmptyWidget();
      case otherCalendar:
        return const EmptyWidget();
      case mailboxSent:
        return const EmptyWidget();
      case inbox:
        return const BadgeMessage();
      // case department:
      //   return const EmptyWidget();
      case news:
        return const EmptyWidget();
      // case attendance:
      //   return const EmptyWidget();
    }
  }

  void onPressed() {
    XToast.show(
        "Chức năng đang được phát triển. Sẽ có sẵn trong phiên bản tiếp theo");
  }
}
