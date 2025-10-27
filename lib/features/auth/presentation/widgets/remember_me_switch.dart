import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

/// Remember me switch widget for login screen
/// Follows Single Responsibility Principle - only handles switch UI
class RememberMeSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const RememberMeSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.rememberMe,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: AppColors.success,
          activeThumbColor: AppColors.white,
        ),
      ],
    );
  }
}
