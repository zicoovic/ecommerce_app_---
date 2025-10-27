import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Reusable custom back button with circular background
/// Used in app bars across authentication screens
class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: EdgeInsets.all(8.w),
        decoration: const BoxDecoration(
          // color: AppColors.lightGrayBackground,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.arrow_back, size: 20.sp),
      ),
      onPressed: onPressed ?? () => context.pop(),
    );
  }
}

/// Reusable custom app bar for authentication screens
/// Provides consistent styling across all auth screens
class CustomAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;

  const CustomAuthAppBar({super.key, this.onBackPressed, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: CustomBackButton(onPressed: onBackPressed),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
