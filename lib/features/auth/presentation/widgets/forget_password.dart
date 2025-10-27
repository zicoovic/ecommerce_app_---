import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: Navigate to forgot password
        },
        child: Text(
          'Forgot password?',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.error,
              ),
        ),
      ),
    );
  }
}
