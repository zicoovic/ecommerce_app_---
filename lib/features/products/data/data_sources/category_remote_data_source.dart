import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/network/api_service.dart';
import 'package:ecommerce_app/features/products/data/models/category_model.dart';

// class CategoryRemoteDataSource we use it to get categories from API
class CategoryRemoteDataSource {
  // instance from ApiService
  final ApiService apiService;

  CategoryRemoteDataSource({required this.apiService});

  // Function to get categories
  // return List<CategoryModel>
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiService.get(ApiConstants.categories);
    return response.data.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
