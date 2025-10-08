import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/utils/validators.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback? onChanged;

  const PasswordField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: 'Password',
      hintText: 'Enter your password',
      controller: widget.controller,
      validator: Validators.validatePassword,
      obscureText: _obscurePassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword ? Icons.visibility_off : Icons.visibility,
          color: AppColors.textSecondary,
          size: 20.sp,
        ),
        onPressed: () => setState(() {
          _obscurePassword = !_obscurePassword;
        }),
      ),
      onChanged: widget.onChanged,
    );
  }
}