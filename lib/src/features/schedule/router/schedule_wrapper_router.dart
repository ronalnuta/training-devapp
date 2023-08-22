import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/schedule/router/schedule_router.dart';

class ScheduleWrapperPage extends StatelessWidget {
  const ScheduleWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: (_) => context.read<ScheduleCoordinator>(),
      child: context.read<ScheduleCoordinator>().getNavigator(),
    );
  }
}
