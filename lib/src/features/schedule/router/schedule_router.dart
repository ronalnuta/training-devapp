import 'package:flutter/material.dart';
import 'package:my_app/src/features/common/pages/not_found_page.dart';
import 'package:my_app/src/features/schedule/pages/schedule_page.dart';
import 'package:my_app/src/router/base_coordinator.dart';

class XScheduleRouterName {
  static const String schedule = '/schedule';
}

class ScheduleCoordinator extends BaseCoordinator {
  @override
  String get initialRoute => XScheduleRouterName.schedule;

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XScheduleRouterName.schedule:
        return MaterialPageRoute(builder: (_) => const SchedulePage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
