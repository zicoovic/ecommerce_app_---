import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
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

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
            size: 20.sp,
          ),
        ),
        onPressed: () => context.pop(),
      ),
    );
  }

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
              _buildHeader(),
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

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Please enter your data to continue',
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        EmailField(
          controller: _emailController,
        ),
        SizedBox(height: 24.h),
        PasswordField(
          controller: _passwordController,
        ),
      ],
    );
  }

  Widget _buildRememberMe() {
    return RememberMeSwitch(
      value: _rememberMe,
      onChanged: (value) => setState(() => _rememberMe = value),
    );
  }

  Widget _buildLoginButton(bool isLoading) {
    return GradientButton(
      text: 'Login',
      isLoading: isLoading,
      onPressed: _handleLogin,
    );
  }
}