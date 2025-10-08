import 'package:ecommerce_app/core/utils/preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _selectedGender = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: Center(
        child: Stack(
          children: [
            Center(child: Image.asset('assets/images/onboarding.png')),
            Positioned(
              bottom: 50.h,
              left: 15.w,
              right: 15.w,
              child: Container(
                width: 345.w,
                height: 248.h,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Look Good, Feel Good',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Create your individual & unique style and look amazing everyday.",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomButton(
                          isSelected: _selectedGender,
                          title: 'Men',
                          onPressed: () async {
                            await PreferencesHelper.saveGender('men');
                            setState(() {
                              _selectedGender = !_selectedGender;
                            });
                            GoRouter.of(context).go('/login');
                          },
                        ),
                        CustomButton(
                          isSelected: !_selectedGender,
                          title: 'Women',
                          onPressed: () async {
                            await PreferencesHelper.saveGender('women');
                            setState(() {
                              _selectedGender = !_selectedGender;
                            });
                            GoRouter.of(context).go('/login');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    TextButton(
                      onPressed: () async {
                        await PreferencesHelper.saveGender('all');
                        GoRouter.of(context).go('/login');
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 152.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryPurple : AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
