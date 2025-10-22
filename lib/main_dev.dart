import 'package:ecommerce_app/core/di/injection_container.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  const String apiUrl = 'https://jsonplaceholder.typicode.com';
  runApp(const MainApp(apiUrl: apiUrl));
}
