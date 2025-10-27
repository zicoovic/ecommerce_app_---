import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Factory class for creating consistent input decorations
/// Follows Factory Pattern (OOP) and Single Responsibility Principle
class InputDecorationFactory {
  const InputDecorationFactory._();

  /// Creates a standard input decoration with customizable properties
  /// Now theme-aware - pass BuildContext to use theme colors
  static InputDecoration create({
    required String hintText,
    BuildContext? context,
    TextStyle? hintStyle,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    double? borderRadius,
  }) {
    // Get theme-aware colors if context is provided
    final isDark = context != null
        ? Theme.of(context).brightness == Brightness.dark
        : false;

    final defaultFillColor = isDark ? AppColors.darkSurface : AppColors.white;
    final defaultBorderColor = isDark ? AppColors.darkBorder : AppColors.borderColor;
    final defaultHintColor = isDark ? AppColors.darkTextHint : AppColors.textHint;

    return InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle ??
          TextStyle(
            color: defaultHintColor,
            fontSize: 15.sp,
          ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      filled: true,
      fillColor: fillColor ?? defaultFillColor,
      border: _buildBorder(borderRadius, BorderSide.none),
      enabledBorder: _buildBorder(
        borderRadius,
        BorderSide(color: defaultBorderColor, width: 1),
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