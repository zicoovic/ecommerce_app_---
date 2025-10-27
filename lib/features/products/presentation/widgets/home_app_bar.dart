import 'package:ecommerce_app/core/widgets/theme_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Custom app bar for home screen
/// Contains menu icon and shopping bag icon
/// Follows Single Responsibility Principle
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onCartPressed;

  const HomeAppBar({
    super.key,
    required this.onMenuPressed,
    required this.onCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconButton(
              icon: Icons.menu,
              onPressed: onMenuPressed,
            ),
            Row(
              children: [
                const ThemeToggleButton(),
                SizedBox(width: 8.w),
                _buildIconButton(
                  icon: Icons.shopping_bag_outlined,
                  onPressed: onCartPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds circular icon button with light background
  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 45.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 24.sp,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}