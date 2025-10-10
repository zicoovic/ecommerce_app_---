import 'package:ecommerce_app/core/di/injection_container.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/onboarding/onboarding_screen.dart';
import 'package:ecommerce_app/features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/screens/products_list_screen.dart';
import 'package:ecommerce_app/features/welcome/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouteGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onboarding,
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
        builder: (context, state) => const LoginScreen(),
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
