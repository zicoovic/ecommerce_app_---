import 'package:ecommerce_app/features/products/data/data_sources/category_remote_data_source.dart';

// class CategoryRepositoryImpl
class CategoryRepositoryImpl {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepositoryImpl({required this.categoryRemoteDataSource});

  Future<List<dynamic>> getCategories() =>
      categoryRemoteDataSource.getCategories();
}
