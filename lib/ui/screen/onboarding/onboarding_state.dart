part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final int curlIndex;

  @override
  List<Object?> get props => [
    curlIndex,
  ];

  const OnboardingState({
    this.curlIndex = 1,
  });

  OnboardingState copyWith({
    int? curlIndex,
  }) {
    return OnboardingState(
      curlIndex: curlIndex ?? this.curlIndex,
    );
  }
}