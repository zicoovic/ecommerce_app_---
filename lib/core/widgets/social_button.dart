import 'package:ecommerce_app/core/constants/app_colors.dart';
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
    this.textColor = AppColors.white,
    this.iconColor = AppColors.white,
    required this.onPressed,
  });

  /// Facebook button factory
  factory SocialButton.facebook({required VoidCallback onPressed}) {
    return SocialButton(
      text: 'Facebook',
      icon: Icons.facebook,
      backgroundColor: AppColors.facebookBlue,
      onPressed: onPressed,
    );
  }

  /// Twitter button factory
  factory SocialButton.twitter({required VoidCallback onPressed}) {
    return SocialButton(
      text: 'Twitter',
      icon: Icons.flutter_dash, // Using placeholder, replace with twitter icon
      backgroundColor: AppColors.twitterBlue,
      onPressed: onPressed,
    );
  }

  /// Google button factory
  factory SocialButton.google({required VoidCallback onPressed}) {
    return SocialButton(
      text: 'Google',
      icon: Icons.g_mobiledata,
      backgroundColor: AppColors.googleRed,
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
            Builder(
              builder: (context) => Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}