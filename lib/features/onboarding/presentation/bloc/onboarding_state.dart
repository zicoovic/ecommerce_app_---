import 'package:ecommerce_app/features/onboarding/domain/entities/gender_selection.dart';
import 'package:equatable/equatable.dart';

/// States for onboarding feature
/// Follows State pattern
abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

class OnboardingLoading extends OnboardingState {
  final GenderSelection gender;

  const OnboardingLoading(this.gender);

  @override
  List<Object?> get props => [gender];
}

class OnboardingSuccess extends OnboardingState {
  final GenderSelection gender;

  const OnboardingSuccess(this.gender);

  @override
  List<Object?> get props => [gender];
}

class OnboardingError extends OnboardingState {
  final String message;

  const OnboardingError(this.message);

  @override
  List<Object?> get props => [message];
}