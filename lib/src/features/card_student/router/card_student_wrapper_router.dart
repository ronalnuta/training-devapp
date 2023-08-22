import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/card_student/router/card_student_router.dart';

class CardStudentWrapperPage extends StatelessWidget {
  const CardStudentWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: (_) => context.read<CardStudentCoordinator>(),
      child: context.read<CardStudentCoordinator>().getNavigator(),
    );
  }
}
