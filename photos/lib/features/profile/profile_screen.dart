import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photos/core/utils/app_colors.dart';
import 'package:photos/core/widgets/custom_button.dart';
import 'package:photos/core/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  final bool isCurrentUserProfile;
  final String userId;
  final String userName;
  final String userAvatarUrl;
  final String userLocation;
  final String tappedImageUrl;

  const ProfileScreen({
    super.key,
    this.isCurrentUserProfile = false,
    this.userId = '',
    this.userName = '',
    this.userAvatarUrl = '',
    this.userLocation = '',
    this.tappedImageUrl = '',
  });

  const ProfileScreen.userData({
    super.key,
    required this.userId,
    required this.userName,
    required this.userAvatarUrl,
    this.isCurrentUserProfile = false,
    this.userLocation = '',
    this.tappedImageUrl = '',
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _itemCount = 20; // Initial number of items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: widget.isCurrentUserProfile
            ? null // No back button for current user's profile
            : IconButton(
                icon: SvgPicture.asset('assets/icons/back_button.svg'),
                onPressed: () {
                  context.pop();
                },
              ),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Center(
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: const CachedNetworkImageProvider(
                  'https://i.pravatar.cc/150?img=68', // Placeholder avatar with a fixed seed
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: CustomText(
                text: widget.userName.isNotEmpty
                    ? widget.userName
                    : 'Profile', // Use provided name or default
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: 5.h),
            Center(
              child: CustomText(
                text: widget.userLocation.isNotEmpty
                    ? widget.userLocation
                    : 'Unknown Location',
                fontSize: 14.sp,
                color: AppColors.textColor.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 20.h),
            if (!widget.isCurrentUserProfile)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        // TODO: Implement Follow functionality
                      },
                      color: AppColors.textColor,
                      radius: 8.r,
                      content: CustomText(
                        text: 'FOLLOW',
                        fontSize: 16.sp,
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        // TODO: Implement Message functionality
                      },
                      color: AppColors.backgroundColor,
                      addBorder: true,
                      borderColor: AppColors.textColor,
                      radius: 8.r,
                      content: CustomText(
                        text: 'MESSAGE',
                        fontSize: 16.sp,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 30.h),
            MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 8.w,
              itemCount: _itemCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // Placeholder for image item
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/seed/' +
                        (widget.userId.isNotEmpty ? widget.userId : 'profile') +
                        '_$index/500/${400 + index * 20}', // Use user ID as seed for different images per user
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            Center(
              child: CustomButton(
                onPressed: () {
                  setState(() {
                    _itemCount += 20; // Add 20 more items
                  });
                },
                color: AppColors.backgroundColor,
                addBorder: true,
                borderColor: AppColors.textColor,
                width: double.infinity,
                radius: 8.r,
                content: CustomText(
                  text: 'SEE MORE',
                  fontSize: 16.sp,
                  color: AppColors.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
