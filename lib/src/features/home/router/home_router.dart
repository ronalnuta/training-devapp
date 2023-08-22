import 'package:flutter/material.dart';
import 'package:my_app/src/features/common/pages/not_found_page.dart';
import 'package:my_app/src/features/home/pages/home_page.dart';
import 'package:my_app/src/router/base_coordinator.dart';

class XHomeRouterName {
  static const String home = '/home';
}

class HomeCoordinator extends BaseCoordinator {
  @override
  String get initialRoute => XHomeRouterName.home;

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XHomeRouterName.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
