import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class XScreen {
  // https://www.icwebdesign.co.uk/common-viewport-sizes
  static final double hBottomNavigation = 90.h;
  static bool hasBottomNotch(BuildContext context) {
    if (kIsWeb) return false;
    if (Platform.isIOS) {
      return MediaQuery.of(context).size.height >= 812.0;
    }

    return false;
  }
}
