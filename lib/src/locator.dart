import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/config/devices/app_info.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/features/schedule/cubit/list_schedule_bloc.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/src/theme/themes.dart';

import 'features/common/app_cubit/bloc_observer.dart';

class ConfigApp {
  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(XTheme.barOverLayStyle);
    _locator();
    await Future.wait([
      // Firebase.initializeApp(),
      // AnalyticsService.instance.init(),
      AppInfo.initialize(),
      UserPrefs.instance.initialize(),
    ]);

    Bloc.observer = XBlocObserver();
  }

  static void _locator() {
    GetIt.I
      ..registerLazySingleton(() => Domain())
      ..registerLazySingleton(() => AccountBloc())
      ..registerLazySingleton(() => ListScheduleBloc());
  }
}
