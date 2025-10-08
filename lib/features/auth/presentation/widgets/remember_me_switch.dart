import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          'Remember me',
          style: TextStyle(fontSize: 15.sp, color: AppColors.textPrimary),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: AppColors.success,
          activeColor: AppColors.white,
        ),
      ],
    );
  }
}
