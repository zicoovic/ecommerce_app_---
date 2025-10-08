import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/utils/validators.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onChanged;
  final bool showCheckIcon;

  const EmailField({
    super.key,
    required this.controller,
    this.onChanged,
    this.showCheckIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: 'Email',
      hintText: 'Enter your email',
      controller: controller,
      validator: Validators.validateEmail,
      keyboardType: TextInputType.emailAddress,
      suffixIcon: showCheckIcon
          ? Icon(
              Icons.check,
              color: AppColors.success,
              size: 20.sp,
            )
          : null,
      onChanged: onChanged,
    );
  }
}