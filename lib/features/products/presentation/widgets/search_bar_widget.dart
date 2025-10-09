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
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: const Color(0xFF8F959E),
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0xFF8F959E),
            size: 24.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
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
            colors: [Color(0xFF9747FF), Color(0xFF6C63FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(
          Icons.mic_none,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
    );
  }
}