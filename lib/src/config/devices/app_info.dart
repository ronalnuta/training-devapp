import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:my_app/src/utils/helper/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static late DeviceInfo device;
  static late PackageInfo package;

  static Future initialize() async {
    await Future.wait([
      loadDevice(),
      loadPackage(),
    ]);
  }

  static Future loadDevice() async {
    try {
      final DeviceInfoPlugin plugin = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final AndroidDeviceInfo info = await plugin.androidInfo;
        device = DeviceInfo(
          isPhysicalDevice: info.isPhysicalDevice,
          uid: info.id,
          name: info.device,
          platformName: info.version.baseOS,
          platformVersion: info.version.release,
          model: info.model,
        );
      } else if (Platform.isIOS) {
        final IosDeviceInfo info = await plugin.iosInfo;
        device = DeviceInfo(
          isPhysicalDevice: info.isPhysicalDevice,
          uid: info.identifierForVendor,
          name: info.name,
          platformName: info.systemName,
          platformVersion: info.systemVersion,
          model: info.model,
        );
      }
    } catch (e) {
      device = DeviceInfo();
      LoggerHelper.error(e.toString());
    }
  }

  static Future loadPackage() async {
    package = await PackageInfo.fromPlatform();
  }
}

class DeviceInfo {
  String? uid;
  String? name;
  String? platformName;
  String? platformVersion;
  String? model;
  bool isPhysicalDevice;
  DeviceInfo({
    this.isPhysicalDevice = true,
    this.uid,
    this.name,
    this.platformName,
    this.platformVersion,
    this.model,
  });
}
