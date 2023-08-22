import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/src/theme/styles.dart';
import 'package:my_app/src/utils/helper/radius.dart';

import 'colors.dart';

class XTheme {
  static const barOverLayStyle = SystemUiOverlayStyle.light;

  static ThemeData light() => ThemeData(
        inputDecorationTheme: const InputDecorationTheme(),
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(primary: XColors.primary),
        primaryColor: XColors.primary,
        primarySwatch: XColors.primaryColors,
        scaffoldBackgroundColor: XColors.scaffoldBackground,
        iconTheme: const IconThemeData(),
        textTheme: XStyles.textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.41,
            height: 1.5,
          ),
          systemOverlayStyle: barOverLayStyle,
        ),
        buttonTheme: const ButtonThemeData(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            foregroundColor: Colors.white,
            disabledBackgroundColor: XColors.diableButton,
            disabledForegroundColor: Colors.white,
            backgroundColor: XColors.primary,
            shadowColor: XColors.shadowButton,
            fixedSize: Size(340.w, 55.h),
            shape: RoundedRectangleBorder(borderRadius: BorderHelper.r30),
          ),
        ),
        outlinedButtonTheme:
            OutlinedButtonThemeData(style: OutlinedButton.styleFrom()),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderHelper.r4),
          ),
        ),
      );

  static ThemeData dark() => ThemeData.dark();
}
