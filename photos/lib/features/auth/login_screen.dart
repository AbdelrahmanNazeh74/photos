import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photos/core/utils/app_colors.dart';
import 'package:photos/core/widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 48.h),
              CustomText(
                text: 'Welcome Back',
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: 'Sign in to continue',
                fontSize: 16.sp,
                color: Colors.grey[600]!,
              ),
              SizedBox(height: 48.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email, size: 20.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock, size: 20.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: CustomText(
                    text: 'Login',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: TextButton(
                  onPressed: () {
                    // TODO: Navigate to register
                  },
                  child: CustomText(
                    text: 'Don\'t have an account? Register',
                    fontSize: 14.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
