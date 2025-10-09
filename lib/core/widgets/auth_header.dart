import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Reusable authentication screen header widget
/// Follows Single Responsibility Principle - only handles header UI
/// Follows Open/Closed Principle - open for extension via parameters
class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        SizedBox(height: 8.h),
        _buildSubtitle(),
      ],
    );
  }

  /// Builds the title text
  /// Follows Single Responsibility Principle
  Widget _buildTitle() {
    return Text(
      title,
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }

  /// Builds the subtitle text
  /// Follows Single Responsibility Principle
  Widget _buildSubtitle() {
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: 15.sp,
        color: AppColors.textSecondary,
      ),
    );
  }
}
