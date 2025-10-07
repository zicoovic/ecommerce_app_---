import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/network/api_service.dart';
import 'package:ecommerce_app/features/products/data/models/category_model.dart';

class CategoryRemoteDataSource {
  final ApiService apiService;

  CategoryRemoteDataSource({required this.apiService});

  Future<List<CategoryModel>> getCategories() async {
    final response = await apiService.get(ApiConstants.categories);
    return (response.data['categories'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}
