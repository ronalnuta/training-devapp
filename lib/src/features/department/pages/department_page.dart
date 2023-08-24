import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/department/cubit/department_bloc.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/widgets/common/empty_widget.dart';
import 'package:my_app/widgets/common/indicator.dart';

class DepartmentPage extends StatelessWidget {
  const DepartmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DepartmentBloc(),
      child: BlocBuilder<DepartmentBloc, DepartmentState>(
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Đơn vị", textAlign: TextAlign.center),
            ),
            body: state.isLoading
                ? const XIndicator()
                : state.list.isEmpty
                    ? const EmptyWidget()
                    : Scrollbar(
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          itemBuilder: (_, i) {
                            return Container(
                              decoration: BoxDecoration(
                                color: i % 2 == 0
                                    ? XColors.notification.withOpacity(0.2)
                                    : XColors.itemCard.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              height: 65.h,
                              margin: EdgeInsets.symmetric(
                                vertical: 7.h,
                                horizontal: 30.w,
                              ),
                              child: InkWell(
                                onTap: () =>
                                    XCoordinator.showLecturersDepartment(
                                  departmentId: state.list[i].id,
                                  departmentName: state.list[i].name,
                                ),
                                highlightColor: i % 2 == 0
                                    ? XColors.notification.withOpacity(0.15)
                                    : XColors.itemCard.withOpacity(0.15),
                                splashColor: i % 2 == 0
                                    ? XColors.notification.withOpacity(0.3)
                                    : XColors.itemCard.withOpacity(0.3),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: FittedBox(
                                          child: Container(
                                            color: i % 2 == 0
                                                ? XColors.itemCard
                                                : XColors.notification,
                                            width: 5.w,
                                            height: 65.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.list[i].name,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -0.41,
                                              height: 1.5,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: state.list.length,
                        ),
                      ),
          );
        },
        buildWhen: (p, c) => p.list != c.list || p.isLoading != c.isLoading,
      ),
    );
  }
}
