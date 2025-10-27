import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicator({
    super.key,
    required this.password,
  });

  Color _getStrengthColor(String strength) {
    switch (strength) {
      case 'Strong':
        return AppColors.success;
      case 'Medium':
        return AppColors.warning;
      case 'Weak':
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty) return const SizedBox.shrink();

    final strength = Validators.getPasswordStrength(password);

    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Text(
        strength,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: _getStrengthColor(strength),
        ),
      ),
    );
  }
}