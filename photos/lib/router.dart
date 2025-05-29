import 'package:go_router/go_router.dart';
import 'package:photos/screens/login_screen.dart';
import 'package:photos/screens/register_step1_screen.dart';
import 'package:photos/screens/register_step2_screen.dart';
import 'package:photos/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register_step1',
      builder: (context, state) => const RegisterStep1Screen(),
    ),
    GoRoute(
      path: '/register_step2',
      builder: (context, state) => const RegisterStep2Screen(),
    ),
  ],
);
