import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/features/attendance/cubit/manager_attendance_bloc.dart';
import 'package:my_app/src/theme/colors.dart';

class ManagerAttendancePage extends StatelessWidget {
  final String courseId;
  final String semesterId;
  const ManagerAttendancePage({
    super.key,
    required this.courseId,
    required this.semesterId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ManagerAttendanceBloc(semesterId: semesterId, courseId: courseId),
      child: BlocBuilder<ManagerAttendanceBloc, ManagerAttendanceState>(
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Quản lý Điểm danh",
                textAlign: TextAlign.center,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(children: [
                    Image.asset(XImage.check),
                    const SizedBox(width: 15),
                    Text("0/${state.list.length}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300)),
                  ]),
                ),
                DefaultTabController(
                  length: 2,
                  child: Expanded(
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: const TabBar(
                            tabs: [
                              Tab(text: "Đã điểm danh"),
                              Tab(text: "Chưa điểm danh")
                            ],
                            indicatorColor: XColors.primary,
                            dividerColor: Colors.transparent,
                            labelColor: Colors.black,
                            labelStyle: TextStyle(
                                color: XColors.borderDot,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            labelPadding: EdgeInsets.symmetric(horizontal: 2),
                            unselectedLabelColor: Colors.black),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (_, i) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: XColors.primary
                                                      .withOpacity(0.15),
                                                  offset: const Offset(0, 1),
                                                  blurRadius: 5,
                                                  spreadRadius: 0)
                                            ]),
                                        height: 65.h,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 7.h, horizontal: 15.w),
                                        child: InkWell(
                                            onTap: () {},
                                            highlightColor: XColors.primary
                                                .withOpacity(0.15),
                                            splashColor: XColors.primary
                                                .withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15)),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: FittedBox(
                                                              child: Container(
                                                                  color: XColors
                                                                      .primary,
                                                                  width: 5.w,
                                                                  height:
                                                                      65.h)))),
                                                  Expanded(
                                                      flex: 7,
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("${state.list[i].lastName ?? ""} ${state.list[i].firstName ?? ""}",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    letterSpacing:
                                                                        -0.41,
                                                                    height:
                                                                        1.5),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1)
                                                          ])),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Color(
                                                                      0xFF6DE65F),
                                                                  shape: BoxShape
                                                                      .circle),
                                                          width: 20,
                                                          height: 20))
                                                ])));
                                  },
                                  itemCount: state.list.length),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (_, i) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: XColors.primary
                                                      .withOpacity(0.15),
                                                  offset: const Offset(0, 1),
                                                  blurRadius: 5,
                                                  spreadRadius: 0)
                                            ]),
                                        height: 65.h,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 7.h, horizontal: 15.w),
                                        child: InkWell(
                                            onTap: () {},
                                            highlightColor: XColors.primary
                                                .withOpacity(0.15),
                                            splashColor: XColors.primary
                                                .withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15)),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: FittedBox(
                                                              child: Container(
                                                                  color: XColors
                                                                      .primary,
                                                                  width: 5.w,
                                                                  height:
                                                                      65.h)))),
                                                  Expanded(
                                                      flex: 7,
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("${state.list[i].lastName ?? ""} ${state.list[i].firstName ?? ""}",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    letterSpacing:
                                                                        -0.41,
                                                                    height:
                                                                        1.5),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1)
                                                          ])),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Color(
                                                                      0xFF6DE65F),
                                                                  shape: BoxShape
                                                                      .circle),
                                                          width: 20,
                                                          height: 20))
                                                ])));
                                  },
                                  itemCount: state.list.length),
                            ]),
                      ),
                    ]),
                  ),
                )
              ]),
            ),
          );
        },
        buildWhen: (p, c) => p.list != c.list,
      ),
    );
  }
}
