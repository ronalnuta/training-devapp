import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/config/constants/images.dart';

class LayerApp extends StatelessWidget {
  const LayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      XImage.background,
      width: ScreenUtil().screenWidth,
      fit: BoxFit.fill,
    );
  }
}
