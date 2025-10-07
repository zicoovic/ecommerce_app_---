import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository productRepository;
  ProductsCubit(this.productRepository) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      final products = await productRepository.getProducts();
      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
