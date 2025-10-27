import 'package:ecommerce_app/core/theme/input_decoration_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Custom text field widget for auth screens
/// Follows Single Responsibility Principle - only handles text field UI
/// Uses Factory pattern for decoration creation
class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onChanged;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(),
        SizedBox(height: 8.h),
        _buildTextField(),
      ],
    );
  }

  /// Builds the label widget
  /// Follows Single Responsibility Principle
  Widget _buildLabel() {
    return Builder(
      builder: (context) => Text(
        label,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  /// Builds the text field widget using InputDecorationFactory
  /// Follows Dependency Inversion Principle - depends on abstraction (factory)
  Widget _buildTextField() {
    return Builder(
      builder: (context) => TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecorationFactory.create(
          hintText: hintText,
          context: context,
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged != null ? (_) => onChanged!() : null,
      ),
    );
  }
}
