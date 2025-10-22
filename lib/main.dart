import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/di/injection_container.dart';
import 'package:ecommerce_app/core/routing/route_generation_config.dart';
import 'package:flutter/material.dart';
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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouteGenerationConfig.goRouter,
      ),
    );
  }
}
