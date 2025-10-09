import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Circular back button with light gray background
/// Follows Single Responsibility Principle
class CircularBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CircularBackButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => context.pop(),
      child: Container(
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 18.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}