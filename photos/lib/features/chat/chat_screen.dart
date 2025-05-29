import 'package:flutter/material.dart';
import 'package:photos/core/utils/app_colors.dart';
import 'package:photos/core/widgets/custom_text.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Chat',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: CustomText(
          text: 'Chat Screen',
          fontSize: 20,
          color: AppColors.textColor,
        ),
      ),
    );
  }
}
