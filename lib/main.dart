import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/di/injection_container.dart';
import 'package:ecommerce_app/core/routing/route_generation_config.dart';
import 'package:ecommerce_app/core/theme/app_themes.dart';
import 'package:ecommerce_app/core/theme/theme_cubit.dart';
import 'package:ecommerce_app/core/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  const String apiUrl = ApiConstants.baseUrl;
  runApp(const MainApp(apiUrl: apiUrl));
}

class MainApp extends StatelessWidget {
  final String apiUrl;
  const MainApp({super.key, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    debugPrint('Using API: $apiUrl');
    return BlocProvider(
      create: (context) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            builder: (context, child) => MaterialApp.router(
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: themeState.themeMode,
              debugShowCheckedModeBanner: false,
              routerConfig: RouteGenerationConfig.goRouter,
            ),
          );
        },
      ),
    );
  }
}
