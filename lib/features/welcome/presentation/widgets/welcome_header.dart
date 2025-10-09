import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Welcome screen header with title
/// Displays "Let's Get Started" centered
/// Follows Single Responsibility Principle
class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Let's Get Started",
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 0.3,
      ),
      textAlign: TextAlign.center,
    );
  }
}