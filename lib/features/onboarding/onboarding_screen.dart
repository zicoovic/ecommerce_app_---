import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/widgets/gender_button.dart';
import 'package:ecommerce_app/features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'package:ecommerce_app/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Onboarding screen for gender selection
/// Follows Clean Architecture and Bloc pattern
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF2D1B4E)
          : AppColors.primaryPurple,
      body: BlocListener<OnboardingCubit, OnboardingState>(
        listener: _handleStateChanges,
        child: const _OnboardingContent(),
      ),
    );
  }

  /// Handles state changes and navigation
  /// Separated to follow Single Responsibility Principle
  void _handleStateChanges(BuildContext context, OnboardingState state) {
    if (state is OnboardingSuccess) {
      context.push(AppRoutes.welcome);
    }
  }
}

/// Content widget separated for better organization
/// Follows Single Responsibility Principle
class _OnboardingContent extends StatelessWidget {
  const _OnboardingContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(child: Image.asset('assets/images/onboarding.png')),
          Positioned(
            bottom: 50.h,
            left: 15.w,
            right: 15.w,
            child: _buildCard(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      width: 345.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(),
          SizedBox(height: 10.h),
          _buildSubtitle(),
          SizedBox(height: 20.h),
          _buildGenderButtons(context),
          SizedBox(height: 10.h),
          _buildSkipButton(context),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Builder(
      builder: (context) => Text(
        AppStrings.onboardingTitle,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.white
              : AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildSubtitle() {
    return Builder(
      builder: (context) => Text(
        AppStrings.onboardingSubtitle,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.normal,
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.white
              : AppColors.textPrimary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildGenderButtons(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final isLoading = state is OnboardingLoading;
        final selectedGender =
            state is OnboardingLoading || state is OnboardingSuccess
            ? (state as dynamic).gender.value
            : AppStrings.genderWomen;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GenderButton(
              isSelected: selectedGender == AppStrings.genderMen,
              title: AppStrings.onboardingMen,
              onPressed: isLoading
                  ? () {}
                  : () => context.read<OnboardingCubit>().selectMen(),
            ),
            GenderButton(
              isSelected: selectedGender == AppStrings.genderWomen,
              title: AppStrings.onboardingWomen,
              onPressed: isLoading
                  ? () {}
                  : () => context.read<OnboardingCubit>().selectWomen(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final isLoading = state is OnboardingLoading;

        return TextButton(
          onPressed: isLoading
              ? null
              : () => context.read<OnboardingCubit>().skip(),
          child: Text(
            AppStrings.onboardingSkip,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.textSecondary),
          ),
        );
      },
    );
  }
}
