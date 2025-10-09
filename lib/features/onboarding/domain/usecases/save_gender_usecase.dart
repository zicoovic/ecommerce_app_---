import 'package:ecommerce_app/core/utils/preferences_helper.dart';
import 'package:ecommerce_app/features/onboarding/domain/entities/gender_selection.dart';

/// Use case for saving gender selection
/// Follows Use Case pattern and Single Responsibility Principle
class SaveGenderUseCase {
  Future<void> call(GenderSelection gender) async {
    await PreferencesHelper.saveGender(gender.value);
  }
}