import 'package:ecommerce_app/features/products/presentation/bloc/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          print('🔥 Current state: ${state.runtimeType}');
          if (state is ProductsLoading) {
            print('⏳ Loading...');
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsSuccess) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) => ListTile(title: Text("")),
            );
          } else if (state is ProductsError) {
            return Center(child: Text(state.message));
          } else {
            return Text("Unknown state");
          }
        },
      ),
    );
  }
}
