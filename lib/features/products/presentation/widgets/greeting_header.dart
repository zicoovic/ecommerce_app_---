import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Greeting header showing welcome message
/// "Hello" title and "Welcome to Laza." subtitle
/// Follows Single Responsibility Principle
class GreetingHeader extends StatelessWidget {
  final String name;

  const GreetingHeader({
    super.key,
    this.name = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.2,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Welcome to Laza.',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8F959E),
            height: 1.3,
          ),
        ),
      ],
    );
  }
}