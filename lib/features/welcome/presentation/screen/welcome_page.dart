import 'package:ecommerce_app/features/welcome/presentation/widgets/account_signin_text.dart';
import 'package:ecommerce_app/features/welcome/presentation/widgets/circular_back_button.dart';
import 'package:ecommerce_app/features/welcome/presentation/widgets/create_account_button.dart';
import 'package:ecommerce_app/features/welcome/presentation/widgets/social_buttons_section.dart';
import 'package:ecommerce_app/features/welcome/presentation/widgets/welcome_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Welcome screen - Entry point for new users
/// Displays social login options and account creation
/// Follows Clean Architecture and SOLID principles
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Column(
            children: [
              _buildTopSection(),
              SizedBox(height: 60.h),
              const WelcomeHeader(),
              SizedBox(height: 100.h),
              _buildSocialButtonsSection(),
              SizedBox(height: 100.h),
              _buildBottomSection(context),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  /// Top section with back button
  Widget _buildTopSection() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: const CircularBackButton(),
      ),
    );
  }

  /// Social buttons section
  Widget _buildSocialButtonsSection() {
    return SocialButtonsSection(
      onFacebookPressed: _handleFacebookLogin,
      onTwitterPressed: _handleTwitterLogin,
      onGooglePressed: _handleGoogleLogin,
    );
  }

  /// Bottom section with signin text and create account button
  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        AccountSigninText(onSigninPressed: () => _navigateToLogin(context)),
        SizedBox(height: 16.h),
        CreateAccountButton(onPressed: () => _navigateToRegister(context)),
      ],
    );
  }

  /// Social login handlers
  void _handleFacebookLogin() {
    // TODO: Implement Facebook OAuth login
  }

  void _handleTwitterLogin() {
    // TODO: Implement Twitter OAuth login
  }

  void _handleGoogleLogin() {
    // TODO: Implement Google OAuth login
  }

  /// Navigation methods
  void _navigateToLogin(BuildContext context) {
    context.push('/login');
  }

  void _navigateToRegister(BuildContext context) {
    context.push('/register');
  }
}
