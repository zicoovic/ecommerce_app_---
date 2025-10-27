import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Reusable authentication screen header widget
/// Follows Single Responsibility Principle - only handles header UI
/// Follows Open/Closed Principle - open for extension via parameters
class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        SizedBox(height: 8.h),
        _buildSubtitle(),
      ],
    );
  }

  /// Builds the title text
  /// Follows Single Responsibility Principle
  Widget _buildTitle() {
    return Builder(
      builder: (context) => Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  /// Builds the subtitle text
  /// Follows Single Responsibility Principle
  Widget _buildSubtitle() {
    return Builder(
      builder: (context) => Text(
        subtitle,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
