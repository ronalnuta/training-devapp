import 'package:flutter/material.dart';
import 'package:my_app/src/router/coordinator.dart';

abstract class BaseCoordinator {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String get initialRoute;

  Route<dynamic>? onGenerateRoute(RouteSettings settings);
  NavigatorState get navigator => navigatorKey.currentState!;

  Future? pushNamed(String route) {
    return navigatorKey.currentState!.pushNamed(route);
  }

  Future<T?> push<T extends Object?>(Widget screen) => navigator.push(
        MaterialPageRoute(builder: (context) => screen),
      );

  void onExit() {
    XCoordinator.pop();
  }

  void pop([dynamic result]) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop(result);
    } else {
      onExit();
    }
  }

  void popOnly([dynamic result]) {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState!.pop(result);
    }
  }

  Navigator getNavigator({String? customInitialRoute}) => Navigator(
        key: navigatorKey,
        initialRoute: customInitialRoute ?? initialRoute,
        onGenerateRoute: onGenerateRoute,
      );
}
