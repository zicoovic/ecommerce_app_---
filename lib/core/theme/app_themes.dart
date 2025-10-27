import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  // Cache themes to avoid rebuilding on every access
  static ThemeData? _lightThemeCache;
  static ThemeData? _darkThemeCache;

  /// Light Theme - (default)
  static ThemeData get lightTheme {
    // Return cached theme if available
    if (_lightThemeCache != null) return _lightThemeCache!;

    // Build and cache the theme
    _lightThemeCache = ThemeData(
    /// Brightness: light
    brightness: Brightness.light,

    /// useMaterial3: true
    useMaterial3: true,

    // ========== COLORS ==========
    primaryColor: AppColors.primaryPurple,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,

    // ========== TEXT THEME ==========
    textTheme: TextTheme(
      /// Large titles (32sp, bold)
      displayLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),

      /// Medium titles (24sp, bold)
      displayMedium: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),

      /// Auth headers, large headings (28sp, w600)
      headlineMedium: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
      ),

      /// Section titles (17sp, w600)
      titleLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
      ),

      /// Medium titles (15sp, w500/bold)
      titleMedium: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),

      /// Small titles (13sp, w600)
      titleSmall: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ),

      /// Body text (16sp, w500)
      bodyLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),

      /// Body text - smaller (14sp, w400)
      bodyMedium: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),

      /// Captions (13sp, w500)
      bodySmall: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
      ),

      /// Labels (13sp, w400)
      labelMedium: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),

      /// Hint text (12sp, w400)
      labelSmall: TextStyle(
        color: AppColors.textHint,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    ),

    // ========== APP BAR THEME ==========
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    ),

    // ========== INPUT DECORATION THEME ==========
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      hintStyle: TextStyle(color: AppColors.textHint, fontSize: 14.sp),
      labelStyle: TextStyle(color: AppColors.textSecondary, fontSize: 14.sp),
      floatingLabelStyle: TextStyle(color: AppColors.primaryPurple, fontSize: 14.sp),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.borderFocused, width: 2),
      ),
    ),

    // ========== BUTTON THEMES ==========
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),

    // ========== COLOR SCHEME ==========
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryPurple,
      secondary: AppColors.primaryPurpleDark,
      error: AppColors.error,
      surface: AppColors.white,
      surfaceContainerHighest: AppColors.lightGrayBackground,
    ),);

    return _lightThemeCache!;
  }

  // ========== DARK THEME ==========
  /// Dark Theme -
  static ThemeData get darkTheme {
    // Return cached theme if available
    if (_darkThemeCache != null) return _darkThemeCache!;

    // Build and cache the theme
    _darkThemeCache = ThemeData(
    /// Brightness: dark
    brightness: Brightness.dark,

    useMaterial3: true,

    // ========== COLORS ==========
    primaryColor: AppColors.primaryPurple,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,

    // ========== TEXT THEME ==========
    textTheme: TextTheme(
      /// Large titles (32sp, bold)
      displayLarge: TextStyle(
        color: AppColors.white,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),

      /// Medium titles (24sp, bold)
      displayMedium: TextStyle(
        color: AppColors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),

      /// Auth headers, large headings (28sp, w600)
      headlineMedium: TextStyle(
        color: AppColors.white,
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
      ),

      /// Section titles (17sp, w600)
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
      ),

      /// Medium titles (15sp, w500/bold)
      titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),

      /// Small titles (13sp, w600)
      titleSmall: TextStyle(
        color: AppColors.white,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ),

      /// Body text (16sp, w500)
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),

      /// Body text - smaller (14sp, w400)
      bodyMedium: TextStyle(
        color: AppColors.darkTextSecondary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),

      /// Captions (13sp, w500)
      bodySmall: TextStyle(
        color: AppColors.darkTextSecondary,
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
      ),

      /// Labels (13sp, w400)
      labelMedium: TextStyle(
        color: AppColors.darkTextSecondary,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),

      /// Hint text (12sp, w400)
      labelSmall: TextStyle(
        color: AppColors.darkTextHint,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    ),

    // ========== APP BAR THEME ==========
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    ),

    // ========== INPUT DECORATION THEME ==========
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      hintStyle: TextStyle(color: AppColors.darkTextHint, fontSize: 14.sp),
      labelStyle: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14.sp),
      floatingLabelStyle: TextStyle(color: AppColors.primaryPurple, fontSize: 14.sp),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.primaryPurple, width: 2),
      ),
    ),

    // ========== BUTTON THEMES ==========
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),

    // ========== COLOR SCHEME ==========
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryPurple,
      secondary: AppColors.primaryPurpleDark,
      error: AppColors.error,
      surface: AppColors.darkSurface,
      surfaceContainerHighest: AppColors.darkBorder,
    ),);

    return _darkThemeCache!;
  }

  /// Clear theme cache (call this if you need to rebuild themes, e.g., after ScreenUtil re-init)
  static void clearCache() {
    _lightThemeCache = null;
    _darkThemeCache = null;
  }
}

// Note: After modifying theme properties, you may need to hot restart (not just hot reload)
// to clear the cached themes and rebuild them with new properties.
