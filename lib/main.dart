import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final apiService = ApiService();
  // final dataSource = ProductRemoteDataSource(apiService: apiService);
  // final repository = ProductRepositoryImpl(productRemoteDataSource: dataSource);

  // final products = await repository.getProducts();
  // print("Got ${products.length} products through the repository.");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
