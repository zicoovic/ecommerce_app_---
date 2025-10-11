import 'package:ecommerce_app/core/di/injection_container.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce_app/features/onboarding/onboarding_screen.dart';
import 'package:ecommerce_app/features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/screens/products_list_screen.dart';
import 'package:ecommerce_app/features/welcome/presentation/screen/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouteGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onboarding,
    redirect: (context, state) async {
      // Get auth repository to check login status
      final authRepository = getIt<AuthRepository>();
      final isLoggedIn = await authRepository.isLoggedIn();

      final isGoingToProducts = state.matchedLocation == AppRoutes.products;
      final isOnAuthPage =
          state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.register ||
          state.matchedLocation == AppRoutes.onboarding ||
          state.matchedLocation == AppRoutes.welcome;

      // If logged in and on auth pages, go to products
      if (isLoggedIn && isOnAuthPage) {
        return AppRoutes.products;
      }

      // If not logged in and trying to access products, go to login
      if (!isLoggedIn && isGoingToProducts) {
        return AppRoutes.login;
      }

      // No redirect needed
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<OnboardingCubit>(),
          child: const OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.products,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ProductsCubit>()..getProducts(),
          child: const ProductsListScreen(),
        ),
      ),
    ],
  );
}
