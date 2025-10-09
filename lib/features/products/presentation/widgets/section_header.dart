import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: onViewAllPressed,
          child: Text(
            'View All',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF8F959E),
            ),
          ),
        ),
      ],
    );
  }
}