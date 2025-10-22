import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/di/injection_container.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  const String apiUrl = ApiConstants.baseUrl; // ← Prod API
  debugPrint('🔴 PROD MODE - API: $apiUrl');
  runApp(const MainApp(apiUrl: apiUrl));
}
