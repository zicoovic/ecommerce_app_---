import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Splash screen displayed on app launch
/// Checks auth status and navigates accordingly
/// Follows Single Responsibility Principle
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  /// Check auth status and navigate to appropriate screen
  Future<void> _checkAuthAndNavigate() async {
    // Show splash for minimum duration
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Check if user is logged in
    context.read<AuthCubit>().checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          // User is logged in, go to products screen
          GoRouter.of(context).pushReplacement(AppRoutes.products);
        } else if (state is AuthInitial) {
          // User is not logged in, go to onboarding
          GoRouter.of(context).pushReplacement(AppRoutes.onboarding);
        }
        // Handle loading and error states silently during splash
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryPurpleDark,
        body: Center(
          child: Image.asset(
            'assets/images/splash.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}