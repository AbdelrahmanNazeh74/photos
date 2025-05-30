import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photos/core/utils/app_colors.dart';
import 'package:photos/core/widgets/custom_button.dart';
import 'package:photos/core/widgets/custom_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  int _itemCount = 20; // Initial number of items

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: CustomText(
          text: 'Search',
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search all photos',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.textFieldFillColor,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              ),
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: 'ALL RESULTS',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                itemCount: _itemCount,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // Placeholder for image item
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://picsum.photos/seed/${_searchQuery.isEmpty ? 'random' : _searchQuery}_$index/500/${400 + index * 20}', // Placeholder image URLs
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              ),
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
                radius: 8,
                content: CustomText(
                  text: 'SEE MORE',
                  fontSize: 16.sp,
                  color: AppColors
                      .textColor, // Assuming button text is dark on light button
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
