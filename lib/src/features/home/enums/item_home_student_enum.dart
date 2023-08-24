import 'package:flutter/material.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/widgets/common/empty_widget.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

enum ItemHomeStudentEnum {
  calendar,
  studentCard;
  // attendance;

  String get nameOf {
    switch (this) {
      case calendar:
        return "Lịch";
      case studentCard:
        return "Thẻ sinh viên";
      // case attendance:
      //   return "Điểm danh";
    }
  }

  String get iconOf {
    switch (this) {
      case calendar:
        return XImage.calendarHome;
      case studentCard:
        return XImage.studentCard;
      // case attendance:
      //   return XImage.attendance;
    }
  }

  Function() onTap() {
    switch (this) {
      case calendar:
        return () => XCoordinator.showSchedule();
      case studentCard:
        return () => onPressed();
      // case attendance:
      //   return () => onPressed();
    }
  }

  Widget get bagdeOf {
    switch (this) {
      case calendar:
        return const EmptyWidget();
      case studentCard:
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
