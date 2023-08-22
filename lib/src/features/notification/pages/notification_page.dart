import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/notification/cubit/notification_bloc.dart';
import 'package:my_app/src/features/notification/widgets/notification_widget.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (_) => NotificationBloc(),
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'THÔNG BÁO',
                style: textTheme.titleLarge?.copyWith(color: XColors.primary),
                textAlign: TextAlign.center,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: Size(30.w, 30.w),
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                      backgroundColor: XColors.diableButton,
                    ),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
              ],
              centerTitle: false,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(shrinkWrap: true, children: [
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          context.read<NotificationBloc>().onTap(true),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        elevation: state.isShowAll ? 8 : 0,
                        foregroundColor:
                            state.isShowAll ? Colors.white : XColors.primary,
                        backgroundColor:
                            state.isShowAll ? XColors.primary : Colors.white,
                        shadowColor: XColors.primary.withOpacity(0.25),
                        fixedSize: Size(165.w, 32.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderHelper.r30,
                        ),
                      ),
                      child: Text(
                        'Tất cả',
                        style: textTheme.titleLarge?.copyWith(
                          color:
                              state.isShowAll ? Colors.white : XColors.primary,
                          letterSpacing: -0.41,
                          height: 1.5,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          context.read<NotificationBloc>().onTap(false),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        elevation: !state.isShowAll ? 8 : 0,
                        foregroundColor:
                            !state.isShowAll ? Colors.white : XColors.primary,
                        backgroundColor:
                            !state.isShowAll ? XColors.primary : Colors.white,
                        shadowColor: XColors.primary.withOpacity(0.25),
                        fixedSize: Size(165.w, 32.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderHelper.r30,
                        ),
                      ),
                      child: Text(
                        'Chưa đọc',
                        style: textTheme.titleLarge?.copyWith(
                          color:
                              !state.isShowAll ? Colors.white : XColors.primary,
                          letterSpacing: -0.41,
                          height: 1.5,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
                GapHelper.h36,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'TODAY',
                    style: textTheme.titleSmall
                        ?.copyWith(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                GapHelper.h24,
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: const [
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                  ],
                ),
              ]),
            ),
          );
        },
        buildWhen: (p, c) => p.isShowAll != c.isShowAll,
      ),
    );
  }
}
