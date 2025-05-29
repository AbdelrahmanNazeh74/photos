import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photos/core/router/app_router.dart';
import 'package:photos/core/utils/app_colors.dart';
import 'package:photos/core/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    context.go(AppRouter.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Photos',
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            SizedBox(height: 16.h),
            CustomText(
              text: 'Your memories, beautifully organized',
              fontSize: 16.sp,
              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}
