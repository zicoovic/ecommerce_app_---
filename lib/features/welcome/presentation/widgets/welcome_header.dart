import 'package:flutter/material.dart';

/// Welcome screen header with title
/// Displays "Let's Get Started" centered
/// Follows Single Responsibility Principle
class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Let's Get Started",
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 0.3,
      ),
      textAlign: TextAlign.center,
    );
  }
}