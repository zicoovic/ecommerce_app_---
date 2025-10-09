import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Reusable social login button widget
/// Used for Facebook, Twitter, Google login buttons
class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    required this.onPressed,
  });

  /// Facebook button factory
  factory SocialButton.facebook({required VoidCallback onPressed}) {
    return SocialButton(
      text: 'Facebook',
      icon: Icons.facebook,
      backgroundColor: const Color(0xFF4267B2),
      onPressed: onPressed,
    );
  }

  /// Twitter button factory
  factory SocialButton.twitter({required VoidCallback onPressed}) {
    return SocialButton(
      text: 'Twitter',
      icon: Icons.flutter_dash, // Using placeholder, replace with twitter icon
      backgroundColor: const Color(0xFF1DA1F2),
      onPressed: onPressed,
    );
  }

  /// Google button factory
  factory SocialButton.google({required VoidCallback onPressed}) {
    return SocialButton(
      text: 'Google',
      icon: Icons.g_mobiledata,
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
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 24.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}