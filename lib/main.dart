import 'package:ecommerce_app/core/di/injection_container.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/screens/products_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => getIt<ProductsCubit>(),
        child: const ProductsListScreen(),
      ),
    );
  }
}
