import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontSize: 13.sp, color: AppColors.textSecondary),
          children: [
            const TextSpan(
              text:
                  'By connecting your account confirm that you agree\nwith our ',
            ),
            TextSpan(
              text: 'Term and Condition',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: Navigate to terms
                },
            ),
          ],
        ),
      ),
    );
  }
}
