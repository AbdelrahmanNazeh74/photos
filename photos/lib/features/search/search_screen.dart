import 'package:flutter/material.dart';
import 'package:photos/core/utils/app_colors.dart';
import 'package:photos/core/widgets/custom_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Search',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: CustomText(
          text: 'Search Screen',
          fontSize: 20,
          color: AppColors.textColor,
        ),
      ),
    );
  }
}
