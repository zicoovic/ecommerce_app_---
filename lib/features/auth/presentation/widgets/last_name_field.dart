import 'package:ecommerce_app/core/utils/validators.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LastNameField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onChanged;

  const LastNameField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: 'Last Name',
      hintText: 'Enter your last name',
      controller: controller,
      validator: (value) => Validators.validateName(value, 'last name'),
      keyboardType: TextInputType.name,
      onChanged: onChanged,
    );
  }
}