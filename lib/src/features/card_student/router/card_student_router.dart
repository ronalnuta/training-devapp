import 'package:flutter/material.dart';
import 'package:my_app/src/features/card_student/pages/card_student_page.dart';
import 'package:my_app/src/features/common/pages/not_found_page.dart';
import 'package:my_app/src/router/base_coordinator.dart';

class XCardStudentRouterName {
  static const String card = '/card';
}

class CardStudentCoordinator extends BaseCoordinator {
  @override
  String get initialRoute => XCardStudentRouterName.card;

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XCardStudentRouterName.card:
        return MaterialPageRoute(builder: (_) => const CardStudentPage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
