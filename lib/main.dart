import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/config/constants/constants.dart';
import 'package:my_app/src/locator.dart';

import 'src/app.dart';

Future main() async {
  await ConfigApp.initializeApp();
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: Constants.turnOnDevicePreview && !kReleaseMode,
  ));
}
