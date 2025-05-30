import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photos/core/utils/app_colors.dart';
import 'package:photos/core/widgets/custom_button.dart';
import 'package:photos/core/widgets/custom_text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // Import staggered grid view
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // Import MasonryGridView
import 'dart:math'; // Import dart:math for random dimensions
import 'package:photos/features/home/widgets/photo_detail_overlay.dart'; // Import the overlay widget
import 'package:cached_network_image/cached_network_image.dart'; // Import cached_network_image
import 'package:go_router/go_router.dart';
import 'package:photos/core/router/app_router.dart';

const List<String> _sampleNames = [
  'Alice',
  'Bob',
  'Charlie',
  'David',
  'Eve',
  'Frank',
  'Grace',
  'Heidi',
  'Ivan',
  'Judy',
  'Mallory',
  'Olivia',
  'Peter',
  'Quinn',
  'Riley',
  'Sam',
  'Tina',
  'Uma',
  'Victor',
  'Wendy',
];

const List<String> _sampleLocations = [
  'New York, NY',
  'Los Angeles, CA',
  'Chicago, IL',
  'Houston, TX',
  'Phoenix, AZ',
  'Philadelphia, PA',
  'San Antonio, TX',
  'San Diego, CA',
  'Dallas, TX',
  'San Jose, CA',
  'Austin, TX',
  'Jacksonville, FL',
  'Columbus, OH',
  'Fort Worth, TX',
  'Indianapolis, IN',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _browseAllItemCount = 10; // Initial item count for Browse All

  @override
  Widget build(BuildContext context) {
    final random = Random(); // Create a Random instance

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: CustomText(
          text: 'Discover',
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'WHAT\'S NEW TODAY',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 300.h, // Adjusted height to accommodate user info
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Placeholder item count
                  itemBuilder: (context, index) {
                    // Generate random dimensions for placeholder images
                    final int width =
                        random.nextInt(100) + 200; // Width between 200 and 300
                    final int height =
                        random.nextInt(100) + 150; // Height between 150 and 250
                    final String imageUrl =
                        'https://picsum.photos/$width/$height?random=${index + 10}'; // Placeholder image URL (use different random seed)

                    // Generate random dimensions for user avatar placeholder
                    final int avatarSize =
                        50; // Fixed size for avatar placeholder
                    final String avatarUrl =
                        'https://i.pravatar.cc/$avatarSize?img=${index + 1}'; // Placeholder avatar image URL

                    return GestureDetector(
                      onTap: () {
                        // Navigate to profile screen with placeholder user data
                        context.go(
                          '/home' + AppRouter.profile,
                          extra: {
                            'userId': 'user_id_$index', // Placeholder User ID
                            'userName': _sampleNames[index %
                                _sampleNames.length], // Pass the generated name
                            'userAvatarUrl':
                                imageUrl, // Pass the tapped image URL as the avatar
                            'isCurrentUserProfile':
                                false, // Not current user's profile
                            'userLocation': _sampleLocations[index %
                                _sampleLocations
                                    .length], // Pass the generated location
                            'tappedImageUrl':
                                imageUrl, // Pass the tapped image URL
                          },
                        );
                      },
                      child: Container(
                        width: 300.w, // Adjusted width to accommodate user info
                        margin: EdgeInsets.only(right: 12.w),
                        child: Column(
                          // Use a Column for image and user info
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              // Image container takes remaining space
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: CachedNetworkImage(
                                  // Use CachedNetworkImage
                                  imageUrl: imageUrl,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                      child:
                                          CircularProgressIndicator()), // Placeholder while loading
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error), // Error widget
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    8.h), // Spacing between image and user info
                            Row(
                              // Row for user image and text
                              children: [
                                CircleAvatar(
                                  // Placeholder for user image
                                  radius: 16.r,
                                  backgroundColor: Colors.blueGrey,
                                  backgroundImage: CachedNetworkImageProvider(
                                      imageUrl), // Use the tapped image URL for the small avatar as well
                                  // TODO: Add user image here
                                ),
                                SizedBox(
                                    width:
                                        8.w), // Spacing between image and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: _sampleNames[index %
                                          _sampleNames
                                              .length], // Random Placeholder user name from list
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor,
                                    ),
                                    CustomText(
                                      text: _sampleLocations[index %
                                          _sampleLocations
                                              .length], // Random Placeholder location from list
                                      fontSize: 10.sp,
                                      color: Colors.grey[600]!,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              CustomText(
                text: 'BROWSE ALL',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
              SizedBox(height: 16.h),
              MasonryGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                itemCount: _browseAllItemCount,
                itemBuilder: (context, index) {
                  // Generate random dimensions for placeholder images to simulate varying heights
                  final int width =
                      random.nextInt(200) + 100; // Width between 100 and 300
                  final int height =
                      random.nextInt(200) + 150; // Height between 150 and 350
                  final String imageUrl =
                      'https://picsum.photos/$width/$height?random=$index'; // Placeholder image URL

                  // Placeholder user info for the overlay
                  final String userName =
                      'Angelo Pantazis'; // Example name from design
                  final String userHandle =
                      '@angelopantazis'; // Example handle from design
                  final String userAvatarUrlOverlay =
                      'https://i.pravatar.cc/50?img=6'; // Example avatar URL for overlay - keep separate

                  return GestureDetector(
                    onTap: () {
                      // Show the photo detail overlay
                      showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black.withOpacity(
                              0.5), // Semi-transparent black background
                          transitionDuration:
                              Duration(milliseconds: 300), // Animation duration
                          pageBuilder: (BuildContext buildContext,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return PhotoDetailOverlay(
                              imageUrl: imageUrl,
                              userName: userName,
                              userHandle: userHandle,
                              userAvatarUrl: userAvatarUrlOverlay,
                              onUserTap: () {
                                // Navigate to profile screen when user info is tapped
                                context.go(
                                  '/home' + AppRouter.profile,
                                  extra: {
                                    'userId':
                                        'user_id_$index', // Placeholder User ID
                                    'userName':
                                        userName, // Pass the name from the overlay
                                    'userAvatarUrl':
                                        userAvatarUrlOverlay, // Pass the overlay avatar URL as the main avatar
                                    'isCurrentUserProfile':
                                        false, // Not current user's profile
                                    'userLocation': _sampleLocations[index %
                                        _sampleLocations
                                            .length], // Pass a random location
                                    'tappedImageUrl':
                                        imageUrl, // Pass the tapped image URL
                                  },
                                );
                                Navigator.of(context)
                                    .pop(); // Close the overlay
                              },
                            );
                          },
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              // Simple fade transition
                              opacity: animation,
                              child: child,
                            );
                          });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: CachedNetworkImage(
                        // Use CachedNetworkImage
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                            child:
                                CircularProgressIndicator()), // Placeholder while loading
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error), // Error widget
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 24.h),
              CustomButton(
                onPressed: () {
                  setState(() {
                    _browseAllItemCount += 10; // Add 10 more items
                  });
                },
                radius: 8,
                width: double.infinity,
                color: AppColors.backgroundColor,
                borderColor: AppColors.textColor,
                addBorder: true,
                content: CustomText(
                  text: 'SEE MORE',
                  fontSize: 16.sp,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
      // Removed FloatingActionButton as it's not in the Discover screen design
    );
  }
}
