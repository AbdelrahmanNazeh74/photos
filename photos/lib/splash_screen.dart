import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:photos/core/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:photos/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _showButtons = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Animation duration
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start from bottom
      end: Offset.zero, // End at original position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showButtons = true;
        });
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/images/splash_img.png', fit: BoxFit.cover),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/splash_photo.png', height: 80.h),
            ],
          ),
          if (_showButtons)
            Positioned(
              left: 0,
              right: 0,
              bottom: 40.h,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: CustomButton(
                          onPressed: () => context.push('/login'),
                          content: CustomText(text: 'LOG IN', fontSize: 16.sp),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: CustomButton(
                          onPressed: () => context.push('/register_step1'),
                          content: CustomText(
                            text: 'REGISTER',
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
