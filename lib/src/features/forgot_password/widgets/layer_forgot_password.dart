import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';

class LayerForgotPassowrd extends StatelessWidget {
  const LayerForgotPassowrd({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      XImage.forgotPassword,
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      fit: BoxFit.fill,
    );
  }
}
