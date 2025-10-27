import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// Section header with title and "View All" link
/// Used for "Choose Brand", "New Arrival", etc.
/// Follows Single Responsibility Principle
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewAllPressed;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        GestureDetector(
          onTap: onViewAllPressed,
          child: Text(
            'View All',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}