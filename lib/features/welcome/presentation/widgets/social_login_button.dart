import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Social login button with icon and text
/// Supports Facebook, Twitter, and Google styles
/// Follows Open/Closed Principle - open for extension via factories
class SocialLoginButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
  });

  /// Facebook button factory
  factory SocialLoginButton.facebook({
    required VoidCallback onPressed,
  }) {
    return SocialLoginButton(
      text: 'Facebook',
      icon: const Icon(Icons.facebook, color: Colors.white, size: 24),
      backgroundColor: const Color(0xFF4267B2),
      onPressed: onPressed,
    );
  }

  /// Twitter button factory
  factory SocialLoginButton.twitter({
    required VoidCallback onPressed,
  }) {
    return SocialLoginButton(
      text: 'Twitter',
      icon: const Icon(Icons.alternate_email, color: Colors.white, size: 24),
      backgroundColor: const Color(0xFF1DA1F2),
      onPressed: onPressed,
    );
  }

  /// Google button factory
  factory SocialLoginButton.google({
    required VoidCallback onPressed,
  }) {
    return SocialLoginButton(
      text: 'Google',
      icon: const Text(
        'G',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color(0xFFDB4437),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 12.w),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}