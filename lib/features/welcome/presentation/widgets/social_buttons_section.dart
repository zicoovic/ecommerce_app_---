import 'package:ecommerce_app/features/welcome/presentation/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Social login buttons section
/// Contains Facebook, Twitter, and Google buttons with proper spacing
/// Follows Single Responsibility Principle
class SocialButtonsSection extends StatelessWidget {
  final VoidCallback onFacebookPressed;
  final VoidCallback onTwitterPressed;
  final VoidCallback onGooglePressed;

  const SocialButtonsSection({
    super.key,
    required this.onFacebookPressed,
    required this.onTwitterPressed,
    required this.onGooglePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginButton.facebook(onPressed: onFacebookPressed),
        SizedBox(height: 16.h),
        SocialLoginButton.twitter(onPressed: onTwitterPressed),
        SizedBox(height: 16.h),
        SocialLoginButton.google(onPressed: onGooglePressed),
      ],
    );
  }
}