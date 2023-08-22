import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/features/onboarding/cubit/onboarding_bloc.dart';
import 'package:my_app/src/features/onboarding/widgets/dots_decorator.dart';
import 'package:my_app/src/features/onboarding/widgets/dots_indicator.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/widgets/common/empty_widget.dart';

enum TabOnboarding {
  first,
  second,
  third,
}

extension TabOnboardingExt on TabOnboarding {
  String get content {
    switch (this) {
      case TabOnboarding.first:
        return '''Ứng dụng hỗ trợ cho sinh viên và giảng viên của\nTrường Đại học Giao Thông Vận Tải TP. HCM (UTH).''';
      case TabOnboarding.second:
        return '''Truy cập thông tin sinh viên, thông tin giảng viên,\nlịch học, tin tức và các tính năng khác của trường.''';
      case TabOnboarding.third:
        return '''Để đăng nhập vào UTH App, bạn cần sử dụng\ntài khoản của mình, tương tự như khi đăng nhập vào hệ thống của trường.''';
      default:
        return '';
    }
  }

  String get imageBottom {
    switch (this) {
      case TabOnboarding.first:
        return XImage.onboarding1;
      case TabOnboarding.second:
        return XImage.onboarding2;
      case TabOnboarding.third:
        return XImage.onboarding3;
      default:
        return XImage.onboarding2;
    }
  }
}

class BaseOnboarding extends StatelessWidget {
  final TabOnboarding tab;

  const BaseOnboarding({Key? key, required this.tab}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final bloc = context.read<OnboardingBloc>();

        return Scaffold(
          body: Stack(children: [
            Image.asset(
              XImage.background,
              width: ScreenUtil().screenWidth,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                tab.imageBottom,
                width: ScreenUtil().screenWidth,
                height: 195.h,
                fit: BoxFit.fill,
              ),
            ),
            SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 100.h),
                      child: Image.asset(XImage.logo1, fit: BoxFit.scaleDown),
                    ),
                    Text(
                      "UTH App",
                      style: textTheme.titleLarge,
                    ),
                    GapHelper.h20,
                    Text(
                      tab.content,
                      style: textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    GapHelper.h20,
                    DotsIndicator(
                      dotsCount: TabOnboarding.values.length,
                      position: state.currentPage.toDouble(),
                      decorator: const DotsDecorator(
                        color: Colors.white,
                        activeColor: XColors.primary,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: XColors.borderDot,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    GapHelper.h32,
                    ElevatedButton(
                      onPressed: state.isLastScreen
                          ? () => bloc.onStartButton(context)
                          : () => bloc.onContinueButton(),
                      child: Text(
                        state.isLastScreen ? "Bắt đầu" : "Tiếp tục",
                        style: textTheme.labelLarge
                            ?.copyWith(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    GapHelper.h32,
                    state.isLastScreen
                        ? const EmptyWidget()
                        : Align(
                            alignment: Alignment.bottomCenter,
                            child: TextButton(
                              onPressed: () => bloc.onSkipButton(context),
                              child: Text(
                                "Bỏ qua",
                                style: textTheme.titleLarge?.copyWith(
                                  fontSize: 18,
                                  color: XColors.primary,
                                ),
                              ),
                            ),
                          ),
                    GapHelper.h195,
                  ],
                ),
              ),
            ),
          ]),
        );
      },
      buildWhen: (p, c) => p.currentPage != c.currentPage,
    );
  }
}
