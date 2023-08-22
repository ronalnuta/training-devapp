import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/features/forgot_password/widgets/layer_forgot_password.dart';
import 'package:my_app/src/theme/colors.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';
import 'package:my_app/widgets/froms/input.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final pLeft = 10.w;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: pLeft),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              backgroundColor: XColors.diableButton,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: kToolbarHeight + 20,
      ),
      body: SizedBox(
        child: Stack(
          children: [
            const LayerForgotPassowrd(),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 30.w, right: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: pLeft),
                        child: RichText(
                          text: TextSpan(
                            style: textTheme.titleSmall?.copyWith(
                              fontSize: 15,
                              color: XColors.diableButton,
                            ),
                            children: [
                              TextSpan(
                                text: "Tên tài khoản",
                                style: textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: XColors.diableButton,
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: XColors.diableButton,
                                    shape: BoxShape.circle,
                                  ),
                                  width: 7.0,
                                  height: 7.0,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 7),
                                ),
                              ),
                              const TextSpan(text: 'UTH App'),
                            ],
                          ),
                        ),
                      ),
                      GapHelper.h20,
                      Padding(
                        padding: EdgeInsets.only(left: pLeft),
                        child: Text(
                          "Đổi mật khẩu",
                          style: textTheme.displaySmall
                              ?.copyWith(color: XColors.diableButton),
                        ),
                      ),
                      GapHelper.h40,
                      const XInput(
                        value: "",
                        obscureText: true,
                        hintText: "Mật khẩu hiện tại",
                      ),
                      GapHelper.h20,
                      const XInput(
                        value: "",
                        obscureText: true,
                        hintText: "Mật khẩu mới",
                      ),
                      GapHelper.h20,
                      const XInput(
                        value: "",
                        obscureText: true,
                        hintText: "Nhập lại mật khẩu mới",
                      ),
                      GapHelper.h90,
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 18.h,
                          horizontal: 30,
                        ),
                        child:
                            const Divider(thickness: 1, color: XColors.divider),
                      ),
                      ElevatedButton(
                        onPressed: () => onPressed(),
                        child: Text(
                          "Đổi mật khẩu",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      GapHelper.h70,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    XToast.show(
        "Chức năng đang được phát triển. Sẽ có sẵn trong phiên bản tiếp theo");
  }
}
