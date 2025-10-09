import 'package:ecommerce_app/features/onboarding/domain/entities/gender_selection.dart';
import 'package:ecommerce_app/features/onboarding/domain/usecases/save_gender_usecase.dart';
import 'package:ecommerce_app/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit for managing onboarding state
/// Follows Bloc pattern and Separation of Concerns
class OnboardingCubit extends Cubit<OnboardingState> {
  final SaveGenderUseCase saveGenderUseCase;

  OnboardingCubit(this.saveGenderUseCase) : super(const OnboardingInitial());

  void selectMen() => _selectGender(const GenderSelection(value: 'men'));

  void selectWomen() => _selectGender(const GenderSelection(value: 'women'));

  void skip() => _selectGender(const GenderSelection(value: 'all'));

  Future<void> _selectGender(GenderSelection gender) async {
    emit(OnboardingLoading(gender));
    try {
      await saveGenderUseCase(gender);
      emit(OnboardingSuccess(gender));
    } catch (e) {
      emit(OnboardingError(e.toString()));
    }
  }
}