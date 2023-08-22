part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final int currentPage;
  const OnboardingState({this.currentPage = 0});

  bool get isLastScreen => currentPage == 2;

  @override
  List<Object?> get props => [
        currentPage,
      ];

  OnboardingState copyWith({
    int? currentPage,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
