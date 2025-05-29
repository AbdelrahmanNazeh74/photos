import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photos/core/widgets/custom_text.dart'; // Assuming CustomText is in core/widgets
import 'package:cached_network_image/cached_network_image.dart'; // Import cached_network_image

class PhotoDetailOverlay extends StatelessWidget {
  final String imageUrl;
  // You might want to pass user info here later as well
  final String userName;
  final String userHandle;
  final String userAvatarUrl;

  const PhotoDetailOverlay({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.userHandle,
    required this.userAvatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator()), // Placeholder while loading
          errorWidget: (context, url, error) =>
              const Icon(Icons.error), // Error widget
        ),
        // Gradient overlay for better text readability
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black54,
                Colors.transparent,
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.0, 0.2, 0.8, 1.0],
            ),
          ),
        ),
        // Content (User info and Close button)
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.w, vertical: 40.h), // Adjust padding as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top row: User info and Close button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // User Info
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16.r, // Adjust size as needed
                        backgroundImage: CachedNetworkImageProvider(
                            userAvatarUrl), // Use CachedNetworkImageProvider
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: userName,
                            fontSize: 14.sp, // Adjust size as needed
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          CustomText(
                            text: userHandle,
                            fontSize: 12.sp, // Adjust size as needed
                            color: Colors.white70,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Close Button
                  IconButton(
                    icon: Icon(Icons.close,
                        color: Colors.white,
                        size: 24.sp), // Adjust size as needed
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the overlay
                    },
                  ),
                ],
              ),
              // Bottom content (if any, currently empty)
              // SizedBox(height: ...), // Add spacing if needed
            ],
          ),
        ),
      ],
    );
  }
}
