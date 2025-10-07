import 'package:ecommerce_app/features/products/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});
  @override
  Future<List<ProductModel>> getProducts() {
    return productRemoteDataSource.getProducts();
  }
}
