import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Factory class for creating consistent input decorations
/// Follows Factory Pattern (OOP) and Single Responsibility Principle
class InputDecorationFactory {
  const InputDecorationFactory._();

  /// Creates a standard input decoration with customizable properties
  static InputDecoration create({
    required String hintText,
    TextStyle? hintStyle,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    double? borderRadius,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle ??
          TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15.sp,
          ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      filled: true,
      fillColor: fillColor ?? AppColors.white,
      border: _buildBorder(borderRadius, BorderSide.none),
      enabledBorder: _buildBorder(
        borderRadius,
        const BorderSide(color: AppColors.borderColor, width: 1),
      ),
      focusedBorder: _buildBorder(
        borderRadius,
        const BorderSide(color: AppColors.borderFocused, width: 1.5),
      ),
      errorBorder: _buildBorder(
        borderRadius,
        const BorderSide(color: AppColors.error, width: 1),
      ),
      focusedErrorBorder: _buildBorder(
        borderRadius,
        const BorderSide(color: AppColors.error, width: 1.5),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
    );
  }

  static OutlineInputBorder _buildBorder(double? radius, BorderSide side) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius?.r ?? 10.r),
      borderSide: side,
    );
  }
}