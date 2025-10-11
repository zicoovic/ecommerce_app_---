import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/email_field.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/first_name_field.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/gradient_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/last_name_field.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/password_field.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/remember_me_switch.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/term_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Register screen for new user registration
/// Follows Clean Architecture and Bloc pattern
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handles register form submission
  /// Follows Single Responsibility Principle
  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().register(
        _emailController.text,
        _passwordController.text,
        _firstNameController.text,
        _lastNameController.text,
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
    return CustomAuthAppBar(
      onBackPressed: () {
        context.pop();
      },
    );
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
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildHeader(),
              SizedBox(height: 40.h),
              _buildFormFields(),
              SizedBox(height: 16.h),
              _buildRememberMe(),
              SizedBox(height: 24.h),
              const TermAndCondition(),
              SizedBox(height: 10.h),
              _buildRegisterButton(isLoading),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds header with title
  /// Follows Single Responsibility Principle
  Widget _buildHeader() {
    return Text(
      AppStrings.registerTitle,
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }

  /// Builds the form fields (firstName, password, email, lastName)
  /// Follows Single Responsibility Principle
  Widget _buildFormFields() {
    return Column(
      children: [
        FirstNameField(controller: _firstNameController),
        SizedBox(height: 24.h),
        PasswordField(controller: _passwordController),
        SizedBox(height: 24.h),
        EmailField(controller: _emailController),
        SizedBox(height: 24.h),
        LastNameField(controller: _lastNameController),
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

  /// Builds the register button
  /// Follows Single Responsibility Principle
  Widget _buildRegisterButton(bool isLoading) {
    return GradientButton(
      text: AppStrings.registerTitle,
      isLoading: isLoading,
      onPressed: _handleRegister,
    );
  }
}
