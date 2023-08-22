import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';

enum CardPosition { first, middle, last, none }

extension CardPositionExt on CardPosition {
  Radius get topLeft {
    switch (this) {
      case CardPosition.first:
        return Radius.circular(20.r);
      case CardPosition.middle:
        return Radius.circular(0.r);
      case CardPosition.last:
        return Radius.circular(0.r);
      default:
        return Radius.circular(20.r);
    }
  }

  Radius get bottomLeft {
    switch (this) {
      case CardPosition.first:
        return Radius.circular(0.r);
      case CardPosition.middle:
        return Radius.circular(0.r);
      case CardPosition.last:
        return Radius.circular(20.r);
      default:
        return Radius.circular(20.r);
    }
  }

  Radius get topRight {
    switch (this) {
      case CardPosition.first:
        return Radius.circular(20.r);
      case CardPosition.middle:
        return Radius.circular(0.r);
      case CardPosition.last:
        return Radius.circular(0.r);
      default:
        return Radius.circular(20.r);
    }
  }

  Radius get bottomRight {
    switch (this) {
      case CardPosition.first:
        return Radius.circular(0.r);
      case CardPosition.middle:
        return Radius.circular(0.r);
      case CardPosition.last:
        return Radius.circular(20.r);
      default:
        return Radius.circular(20.r);
    }
  }
}

class CardSchedule extends StatelessWidget {
  final String period;
  final String nameCourse;
  final String codeCourse;
  final String nameTeacher;
  final String nameRoom;
  final String timeStart;
  final String timeEnd;
  final bool isExam;
  final CardPosition position;
  final String semesterId;

  const CardSchedule({
    super.key,
    required this.period,
    required this.nameCourse,
    this.isExam = false,
    required this.position,
    required this.codeCourse,
    required this.nameTeacher,
    required this.nameRoom,
    required this.timeStart,
    required this.timeEnd,
    required this.semesterId,
  });

  @override
  Widget build(BuildContext context) {
    final isTeacher = GetIt.I<AccountBloc>().state.isTeacher;
    final topLeft = position.topLeft;
    final bottomLeft = position.bottomLeft;
    final topRight = position.topRight;
    final bottomRight = position.bottomRight;

    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: XColors.diableButton, width: 1.0),
        borderRadius: BorderRadius.only(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        ),
      ),
      margin: EdgeInsets.zero,
      child: Container(
          decoration: BoxDecoration(
              color: XColors.numberCard,
              borderRadius: BorderRadius.only(
                  topLeft: topLeft,
                  topRight: topRight,
                  bottomLeft: bottomLeft,
                  bottomRight: bottomRight)),
          width: 346.w,
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: XColors.numberCard,
                        borderRadius: BorderRadius.only(
                            topLeft: topLeft, bottomLeft: bottomLeft)),
                    child: Center(
                        child: Text(period,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: Colors.white))))),
            const VerticalDivider(
                width: 1, thickness: 1, color: XColors.diableButton),
            Expanded(
                flex: 5,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: topRight, bottomRight: bottomRight)),
                    child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(nameCourse,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      letterSpacing: -0.41,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: isExam
                                          ? XColors.examContent
                                          : Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                          GapHelper.h4,
                          Text("Mã học phần: $codeCourse",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      letterSpacing: -0.41,
                                      fontSize: 14,
                                      color: isExam
                                          ? XColors.examContent
                                          : Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1),
                          GapHelper.h4,
                          Text("Giảng viên: $nameTeacher",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      letterSpacing: -0.41,
                                      fontSize: 14,
                                      color: isExam
                                          ? XColors.examContent
                                          : Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1),
                          GapHelper.h4,
                          Text("Phòng học: $nameRoom",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      letterSpacing: -0.41,
                                      fontSize: 14,
                                      color: isExam
                                          ? XColors.examContent
                                          : Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1),
                          GapHelper.h4,
                          Row(children: [
                            Text(timeStart,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        letterSpacing: -0.41,
                                        fontSize: 14,
                                        color: isExam
                                            ? XColors.examContent
                                            : Colors.black)),
                            const Spacer(),
                            ElevatedButton(
                                onPressed: () => XCoordinator.showAttendance(
                                      codeCourse: codeCourse,
                                      nameCourse: nameCourse,
                                      nameRoom: nameRoom,
                                      nameTeacher: nameTeacher,
                                      semesterId: semesterId,
                                    ),
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    elevation: 0,
                                    foregroundColor: XColors.orange,
                                    backgroundColor: XColors.orange,
                                    fixedSize: Size(113.w, 31.h)),
                                child: Text(isTeacher ? 'Tạo QR' : "Điểm danh",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: Colors.white,
                                            letterSpacing: -0.41,
                                            height: 1.5,
                                            fontSize: 15),
                                    textAlign: TextAlign.center))
                          ])
                        ]))))
          ])),
    );
  }
}
