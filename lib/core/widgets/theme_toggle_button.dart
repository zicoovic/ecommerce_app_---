import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/theme_cubit.dart';
import 'package:ecommerce_app/core/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Theme toggle button widget
/// Switches between light and dark theme
/// Can be placed in app bar or anywhere in the UI
class ThemeToggleButton extends StatelessWidget {
  /// Optional custom size for the icon
  final double? iconSize;

  /// Optional custom colors
  final Color? activeColor;
  final Color? inactiveColor;

  const ThemeToggleButton({
    super.key,
    this.iconSize,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.isDark ||
            (state.isSystem &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

        return IconButton(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              key: ValueKey(isDark),
              size: iconSize,
              color: activeColor ??
                  (isDark ? Colors.yellow.shade700 : AppColors.primaryPurple),
            ),
          ),
          onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
        );
      },
    );
  }
}
