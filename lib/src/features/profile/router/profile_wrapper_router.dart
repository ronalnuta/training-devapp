import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/profile/router/profile_router.dart';

class ProfileWrapperPage extends StatelessWidget {
  const ProfileWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: (_) => context.read<ProfileCoordinator>(),
      child: context.read<ProfileCoordinator>().getNavigator(),
    );
  }
}
