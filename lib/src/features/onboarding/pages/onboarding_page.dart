import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/onboarding/cubit/onboarding_bloc.dart';
import 'package:my_app/src/features/onboarding/widgets/base_onboarding.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, _) {
          return Scaffold(
            body: PageView.builder(
              controller: context.read<OnboardingBloc>().controller,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return BaseOnboarding(tab: TabOnboarding.values[i]);
              },
              itemCount: TabOnboarding.values.length,
            ),
          );
        },
        buildWhen: (p, c) => false,
      ),
    );
  }
}
