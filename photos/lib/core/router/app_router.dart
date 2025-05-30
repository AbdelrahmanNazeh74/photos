import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:photos/features/auth/register_step1_screen.dart';
import 'package:photos/features/splash/splash_screen.dart';
import 'package:photos/features/auth/login_screen.dart';
import 'package:photos/features/auth/register_step2_screen.dart';
import 'package:photos/features/main_wrapper_screen.dart';
import 'package:photos/features/search/search_screen.dart';
import 'package:photos/features/chat/chat_screen.dart';
import 'package:photos/features/profile/profile_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String registerStep1 = '/register_step1';
  static const String registerStep2 = '/register_step2';
  static const String profile = '/profile';
  static const String settings = '/settings';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: registerStep1,
        builder: (context, state) => const RegisterStep1Screen(),
      ),
      GoRoute(
        path: registerStep2,
        builder: (context, state) => const RegisterStep2Screen(),
      ),
      GoRoute(
          path: home,
          builder: (context, state) => const MainWrapperScreen(),
          routes: [
            GoRoute(
              path: 'search',
              builder: (context, state) => const SearchScreen(),
            ),
            GoRoute(
              path: 'chat',
              builder: (context, state) => const ChatScreen(),
            ),
            GoRoute(
              path: 'profile',
              builder: (context, state) {
                final Map<String, dynamic>? extraData =
                    state.extra as Map<String, dynamic>?;
                final String userId = extraData?['userId'] ?? '';
                final String userName = extraData?['userName'] ?? 'Profile';
                final String userAvatarUrl = extraData?['userAvatarUrl'] ?? '';
                final bool isCurrentUserProfile =
                    extraData?['isCurrentUserProfile'] ?? false;
                final String userLocation = extraData?['userLocation'] ?? '';
                final String tappedImageUrl =
                    extraData?['tappedImageUrl'] ?? '';
                return ProfileScreen(
                  userId: userId,
                  userName: userName,
                  userAvatarUrl: userAvatarUrl,
                  isCurrentUserProfile: isCurrentUserProfile,
                  userLocation: userLocation,
                  tappedImageUrl: tappedImageUrl,
                );
              },
            ),
          ]),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(child: Text('Error: ${state.error.toString()}')),
      ),
    ),
  );
}
