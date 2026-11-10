import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/phone_number_screen.dart';
import '../../features/auth/presentation/screens/verify_number_screen.dart';
import '../../features/auth/presentation/screens/name_screen.dart';
import '../../features/auth/presentation/screens/date_of_birth_screen.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/home/presentation/screens/main_tabs_screen.dart';
import '../../features/product/presentation/screens/product_screen.dart';

abstract final class AppRoutes {
  static const onboarding = '/onboarding';
  static const phoneNumber = '/phone-number';
  static const verifyNumber = '/verify-number';
  static const name = '/name';
  static const nameFilled = '/name-filled';
  static const dateOfBirth = '/date-of-birth';
  static const home = '/home';
  static const product = '/product';
  static const welcome = '/welcome';
}

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.phoneNumber,
        name: 'phone-number',
        builder: (context, state) => const PhoneNumberScreen(),
      ),
      GoRoute(
        path: AppRoutes.verifyNumber,
        name: 'verify-number',
        builder: (context, state) => const VerifyNumberScreen(),
      ),
      GoRoute(
        path: AppRoutes.name,
        name: 'name',
        builder: (context, state) => const NameScreen(),
      ),
      GoRoute(
        path: AppRoutes.nameFilled,
        name: 'name-filled',
        builder: (context, state) => const NameScreen(filled: true),
      ),
      GoRoute(
        path: AppRoutes.dateOfBirth,
        name: 'date-of-birth',
        builder: (context, state) => const DateOfBirthScreen(),
      ),
      GoRoute(
        path: AppRoutes.welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const MainTabsScreen(),
      ),
      GoRoute(
        path: AppRoutes.product,
        name: 'product',
        builder: (context, state) => const ProductScreen(),
      ),
    ],
  );
}
