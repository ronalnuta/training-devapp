import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/packages/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/features/common/pages/layer_app.dart';
import 'package:my_app/src/features/login/cubit/login_bloc.dart';
import 'package:my_app/src/utils/helper/gap.dart';
import 'package:my_app/src/utils/helper/radius.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';
import 'package:my_app/widgets/froms/input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: DismissKeyBoard(
            child: SingleChildScrollView(
              child: SizedBox(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: Stack(children: [
                  const LayerApp(),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 100.h),
                          child:
                              Image.asset(XImage.logo1, fit: BoxFit.scaleDown),
                        ),
                        const _InputUser(),
                        GapHelper.h20,
                        const _InputPass(),
                        GapHelper.h20,
                        const _SaveLogin(),
                        GapHelper.h32,
                        const _LoginButton(),
                        GapHelper.h32,
                        TextButton(
                          onPressed: () => onPressed(),
                          child: Text(
                            "Quên mật khẩu",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPressed() {
    XToast.show(
        "Chức năng đang được phát triển. Sẽ có sẵn trong phiên bản tiếp theo");
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, _) {
        return ElevatedButton(
          onPressed: () => context.read<LoginBloc>().onLoginButton(),
          child: Text(
            "Đăng nhập",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontSize: 18, color: Colors.white),
          ),
        );
      },
      buildWhen: (p, c) => false,
    );
  }
}

class _SaveLogin extends StatelessWidget {
  const _SaveLogin();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Checkbox(
            value: state.isSaved,
            onChanged: (_) => context.read<LoginBloc>().onChangedCheckbox(),
            shape: RoundedRectangleBorder(borderRadius: BorderHelper.r4),
          ),
          Text(
            "Lưu thông tin đăng nhập",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ]);
      },
      buildWhen: (p, c) => p.isSaved != c.isSaved,
    );
  }
}

class _InputPass extends StatelessWidget {
  const _InputPass();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return XInput(
          value: state.pass.value,
          onChanged: (s) => context.read<LoginBloc>().onChangedPass(s),
          obscureText: true,
          hintText: "Mật khẩu",
          prefixIcon: Image.asset(
            XImage.icKey,
            color: state.errorPass == null ? null : Colors.red,
            fit: BoxFit.scaleDown,
          ),
          errorText: state.errorPass,
          cursorColor: state.errorPass == null ? null : Colors.red,
        );
      },
      buildWhen: (p, c) => p.pass != c.pass,
    );
  }
}

class _InputUser extends StatelessWidget {
  const _InputUser();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final bloc = context.read<LoginBloc>();

        return XInput(
          value: state.user.value,
          onChanged: (s) => bloc.onChangedUser(s),
          hintText: "Mã đăng nhập/ Mã số sinh viên",
          maxLength: 15,
          prefixIcon: Image.asset(
            XImage.icUser,
            color: state.errorUser == null ? null : Colors.red,
            fit: BoxFit.scaleDown,
          ),
          errorText: state.errorUser,
          counterText: '',
          cursorColor: state.errorUser == null ? null : Colors.red,
        );
      },
      buildWhen: (p, c) => p.user != c.user,
    );
  }
}
