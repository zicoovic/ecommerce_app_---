import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

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
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textTertiary),
        ),
        GestureDetector(
          onTap: onSigninPressed,
          child: Text(
            'Signin',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
