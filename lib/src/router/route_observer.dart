import 'package:flutter/material.dart';
import 'package:my_app/src/utils/helper/logger.dart';

class XRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    final text = 'New route pushed: ${route.settings.name}';
    LoggerHelper.navigator(text);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(
    Route route,
    Route? previousRoute,
  ) {
    final text = 'New route poped: ${route.settings.name}';
    LoggerHelper.navigator(text);
    super.didPop(
      route,
      previousRoute,
    );
  }

  @override
  void didRemove(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    final text = 'New route removed: ${route.settings.name}';
    LoggerHelper.navigator(text);
    super.didRemove(
      route,
      previousRoute,
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final text = 'New route replace: ${newRoute?.settings.name}'
        '\n'
        'Old route replace: ${oldRoute?.settings.name}';
    LoggerHelper.navigator(text);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    final text = 'New route start user gesture: ${route.settings.name}';
    LoggerHelper.navigator(text);
    super.didStartUserGesture(route, previousRoute);
  }
}
