import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Bottom text with action link
/// "Already have an account? Signin"
/// Follows Single Responsibility Principle
class AccountSigninText extends StatelessWidget {
  final VoidCallback onSigninPressed;

  const AccountSigninText({super.key, required this.onSigninPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            color: const Color(0xFF6C757D),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: onSigninPressed,
          child: Text(
            'Signin',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
