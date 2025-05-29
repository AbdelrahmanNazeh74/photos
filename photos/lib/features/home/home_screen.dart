import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photos/core/utils/app_colors.dart';
import 'package:photos/core/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: CustomText(
          text: 'Photos',
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 24.sp),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, size: 24.sp),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 1,
        ),
        itemCount: 10, // TODO: Replace with actual photo count
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Icon(
                Icons.image,
                size: 48.sp,
                color: Colors.grey[600],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          // TODO: Implement photo upload
        },
        child: Icon(Icons.add_photo_alternate, size: 24.sp),
      ),
    );
  }
}
