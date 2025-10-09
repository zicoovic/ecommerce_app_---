import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/widgets/auth_header.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/email_field.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/forget_password.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/gradient_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/password_field.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/remember_me_switch.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/term_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Login screen for user authentication
/// Follows Clean Architecture and Bloc pattern
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handles login form submission
  /// Follows Single Responsibility Principle
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        _emailController.text,
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: BlocListener<AuthCubit, AuthState>(
        listener: _handleAuthStateChanges,
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state is AuthLoading;
            return _buildBody(isLoading);
          },
        ),
      ),
    );
  }

  /// Builds the app bar with back button
  /// Follows Single Responsibility Principle
  PreferredSizeWidget _buildAppBar() {
    return CustomAuthAppBar();
  }

  /// Handles authentication state changes and navigation
  /// Follows Single Responsibility Principle
  void _handleAuthStateChanges(BuildContext context, AuthState state) {
    if (state is AuthSuccess) {
      context.go(AppRoutes.products);
    }
    if (state is AuthError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  /// Builds the main body content
  /// Follows Single Responsibility Principle
  Widget _buildBody(bool isLoading) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const AuthHeader(
                title: AppStrings.loginWelcome,
                subtitle: AppStrings.loginSubtitle,
              ),
              SizedBox(height: 40.h),
              _buildFormFields(),
              SizedBox(height: 16.h),
              const ForgetPassword(),
              SizedBox(height: 8.h),
              _buildRememberMe(),
              SizedBox(height: 24.h),
              const Spacer(),
              const TermAndCondition(),
              SizedBox(height: 10.h),
              _buildLoginButton(isLoading),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the form fields (email and password)
  /// Follows Single Responsibility Principle
  Widget _buildFormFields() {
    return Column(
      children: [
        EmailField(controller: _emailController),
        SizedBox(height: 24.h),
        PasswordField(controller: _passwordController),
      ],
    );
  }

  /// Builds the remember me switch
  /// Follows Single Responsibility Principle
  Widget _buildRememberMe() {
    return RememberMeSwitch(
      value: _rememberMe,
      onChanged: (value) => setState(() => _rememberMe = value),
    );
  }

  /// Builds the login button
  /// Follows Single Responsibility Principle
  Widget _buildLoginButton(bool isLoading) {
    return GradientButton(
      text: AppStrings.loginButton,
      isLoading: isLoading,
      onPressed: _handleLogin,
    );
  }
}
