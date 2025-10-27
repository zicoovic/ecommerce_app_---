import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Reusable gender selection button
/// Follows Single Responsibility Principle - only handles button UI
class GenderButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onPressed;

  const GenderButton({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 152.w,
        height: 60.h,
        decoration: _buildDecoration(),
        child: Center(child: Text(title, style: _buildTextStyle(context))),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: isSelected ? AppColors.primaryPurple : AppColors.white,
      borderRadius: BorderRadius.circular(10.r),
    );
  }

  TextStyle _buildTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: isSelected ? AppColors.white : AppColors.textSecondary,
        );
  }
}
