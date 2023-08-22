import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/features/attendance/cubit/attendance_bloc.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailAttendanceSubjectWidget extends StatelessWidget {
  const DetailAttendanceSubjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isTeacher = GetIt.I<AccountBloc>().state.isTeacher;

    return BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (_, state) {
          return Expanded(
              child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.r)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(-10, 0),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ]),
                width: ScreenUtil().screenWidth,
                child: Column(children: [
                  isTeacher
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(children: [
                            Image.asset(XImage.check),
                            const SizedBox(width: 15),
                            Text("0/${state.list.length}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300)),
                            const Spacer(),
                            GestureDetector(
                              onTap: () =>
                                  XCoordinator.showManagerAttendancePage(
                                courseId:
                                    context.read<AttendanceBloc>().courseId,
                                semesterId:
                                    context.read<AttendanceBloc>().semesterId,
                              ),
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFe8f5fe),
                                      border: Border.all(
                                          color: const Color(0xFF279FF2)),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Text("Quản lý điểm danh",
                                      style: TextStyle(
                                          color: Color(0xFF279FF2),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300))),
                            )
                          ]))
                      : GestureDetector(
                          onTap: () => XCoordinator.showManagerAttendancePage(
                            courseId: context.read<AttendanceBloc>().courseId,
                            semesterId:
                                context.read<AttendanceBloc>().semesterId,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: const Color(0xFF279FF2)),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text("Chưa điểm danh",
                                    style: TextStyle(
                                        color: Color(0xFF279FF2),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300))),
                          ),
                        ),
                  GapHelper.h50,
                  Text('Quét QR để điểm danh ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16, letterSpacing: -0.41, height: 1.375)),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: QrImageView(
                          data: state.qrCode,
                          size: 230,
                          version: QrVersions.auto)),
                  ElevatedButton(
                      onPressed: isTeacher
                          ? () => onPressed()
                          : () => XCoordinator.showScanQR(),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          elevation: 8,
                          foregroundColor: Colors.white,
                          backgroundColor: XColors.primary,
                          shadowColor: XColors.primary.withOpacity(0.25),
                          fixedSize: Size(140.w, 55.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderHelper.r30)),
                      child: Text(isTeacher ? 'Chia sẻ' : "Quét mã QR",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: Colors.white,
                                  letterSpacing: -0.41,
                                  height: 1.5,
                                  fontSize: 18),
                          textAlign: TextAlign.center))
                ])),
          ));
        },
        buildWhen: (p, c) => p.qrCode != c.qrCode || p.list != c.list);
  }

  void onPressed() {
    XToast.show(
        "Chức năng đang được phát triển. Sẽ có sẵn trong phiên bản tiếp theo");
  }
}
