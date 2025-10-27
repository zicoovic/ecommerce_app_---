import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Custom search bar with voice search button
/// Light gray background with search icon and voice icon
/// Follows Single Responsibility Principle
class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onVoiceSearch;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const SearchBarWidget({
    super.key,
    this.controller,
    this.onVoiceSearch,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildSearchField(),
        ),
        SizedBox(width: 12.w),
        _buildVoiceButton(),
      ],
    );
  }

  /// Search input field with search icon
  Widget _buildSearchField() {
    return Builder(
      builder: (context) => Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.textSecondary,
              size: 24.sp,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 14.h),
          ),
        ),
      ),
    );
  }

  /// Voice search button with purple gradient
  Widget _buildVoiceButton() {
    return GestureDetector(
      onTap: onVoiceSearch,
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryPurple, AppColors.secondaryPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(
          Icons.mic_none,
          color: AppColors.white,
          size: 24.sp,
        ),
      ),
    );
  }
}